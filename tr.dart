import 'dart:convert';
import 'dart:io';

import 'my_token.dart';

final langs = {
  'en': 'assets/translations/en.json',
  'ar': 'assets/translations/ar.json',
};

/// يكشف إذا كان النص compact (camelCase, snake_case, kebab-case)
bool _looksLikeCompactText(String text) {
  return !text.contains(' ') &&
      (RegExp(r'[a-z][A-Z]').hasMatch(text) ||
          text.contains('_') ||
          text.contains('-'));
}

/// يحول camel/snake/kebab إلى جملة طبيعية (لترجمة أفضل)
String _toHumanReadable(String text) {
  // نزيل أي رموز غريبة ونستبدلها بمسافات
  String spaced = text.replaceAllMapped(RegExp(r'[^A-Za-z0-9]+'), (_) => ' ');
  // نفصل عند انتقال حرف صغير لحرف كبير
  spaced = text.replaceAllMapped(
    RegExp(r'([a-z])([A-Z])'),
    (match) => '${match[1]} ${match[2]}',
  );
  // ننظف المسافات المتكررة
  spaced = spaced.replaceAll(RegExp(r'\s+'), ' ').trim();

  if (spaced.isEmpty) return text;

  // نحول أول حرف كبير (Title Case)
  return spaced[0].toUpperCase() + spaced.substring(1);
}

/// يحول جملة إنجليزية إلى camelCase لاستخدامها كـ key
String _toCamelCase(String text) {
  final cleanText = text.replaceAll(RegExp(r'[^A-Za-z0-9 ]'), ' ');
  final words = cleanText
      .split(RegExp(r'\s+'))
      .where((w) => w.isNotEmpty)
      .map((w) => w[0].toUpperCase() + w.substring(1).toLowerCase())
      .toList();

  if (words.isEmpty) return text.toLowerCase();

  return words.first.toLowerCase() + words.skip(1).join();
}

/// استدعاء DeepL API لترجمة نص واحد إلى لغة محددة
Future<String> _translateWithDeepL(String text, String targetLang) async {
  final url = Uri.parse('https://api-free.deepl.com/v2/translate');

  final body = {
    'text': [text],
    'target_lang': targetLang,
  };

  final request = await HttpClient().postUrl(url);
  request.headers.contentType = ContentType.json;
  request.headers.add('Authorization', 'DeepL-Auth-Key $apiKey');
  request.write(jsonEncode(body));

  final response = await request.close();
  final responseBody = await response.transform(utf8.decoder).join();

  if (response.statusCode != 200) {
    final errorMsg = jsonDecode(responseBody)['message'] ?? responseBody;
    throw Exception('DeepL Error ${response.statusCode}: $errorMsg');
  }

  final data = jsonDecode(responseBody);
  return data['translations'][0]['text'].trim();
}

/// ترجمة النص للإنجليزي والعربي
Future<Map<String, String>> aiTranslateAll(String originalText) async {
  print('🤖 Translating "$originalText" using DeepL API...');

  final needsFix = _looksLikeCompactText(originalText);
  final textToTranslate =
      needsFix ? _toHumanReadable(originalText) : originalText;

  print(
    needsFix
        ? '   → Converted to human-readable: "$textToTranslate"'
        : '   → Using as-is: "$textToTranslate"',
  );

  try {
    final enTranslation = await _translateWithDeepL(textToTranslate, 'EN');
    final arTranslation = await _translateWithDeepL(textToTranslate, 'AR');

    return {'en': enTranslation, 'ar': arTranslation};
  } catch (e) {
    print('❌ DeepL translation failed: $e');
    if (e.toString().contains('quota')) {
      print('   → ربما خلصت الـ 500,000 حرف الشهرية في DeepL Free');
    }
    return {'error': 'deepl_error'};
  }
}

/// يضيف علامات RTL للنص العربي لعرضه بشكل صحيح في الـ terminal
String _formatArabicForTerminal(String text) {
  // إضافة RIGHT-TO-LEFT EMBEDDING قبل النص و POP DIRECTIONAL FORMATTING بعده
  return '\u202B$text\u202C';
}

/// يتحقق إذا كان الـ key موجود بالفعل في أي ملف ترجمة
bool keyExistsInAnyLanguage(String key) {
  for (final filePath in langs.values) {
    final file = File(filePath);
    if (!file.existsSync()) continue;

    try {
      final content = jsonDecode(file.readAsStringSync());
      if (content.containsKey(key)) {
        print('⚠️ Key "$key" already exists in $filePath');
        return true;
      }
    } catch (_) {
      // ملف تالف أو فارغ
    }
  }
  return false;
}

/// إضافة الترجمة إلى ملفات JSON
Future<void> addTranslation(String keyOrText) async {
  print('🔄 Processing: "$keyOrText"\n');

  final translations = await aiTranslateAll(keyOrText);

  if (translations.containsKey('error') || translations.isEmpty) {
    print('❌ Translation failed. Skipping.\n');
    return;
  }

  // نستخدم الترجمة الإنجليزية لتوليد الـ key
  final englishText = translations['en']!;
  final key = _toCamelCase(englishText);

  if (keyExistsInAnyLanguage(key)) {
    print('⚠️ Key "$key" already exists. Skipping.\n');
    return;
  }

  // كتابة في كل لغة
  for (final entry in langs.entries) {
    final langCode = entry.key;
    final filePath = entry.value;

    final file = File(filePath);
    if (!file.existsSync()) {
      await file.parent.create(recursive: true);
      await file.writeAsString('{}');
    }

    Map<String, dynamic> content;
    try {
      content = jsonDecode(await file.readAsString()) as Map<String, dynamic>;
    } catch (_) {
      content = {};
    }

    content[key] = translations[langCode] ?? keyOrText;

    await file.writeAsString(
      const JsonEncoder.withIndent('  ').convert(content),
    );

    final displayText = langCode == 'ar'
        ? _formatArabicForTerminal(translations[langCode] ?? keyOrText)
        : translations[langCode] ?? keyOrText;
    print('✅ [$langCode] "$key": "$displayText"');
  }

  print('\n🎉 Done! Generated key: "\x1B[33m$key\x1B[0m"\n');
}

void main(List<String> args) async {
  if (args.isEmpty) {
    print('''Usage: dart run tools/translate.dart <text_to_translate>

Example:
  dart run tools/translate.dart "saveChanges"
  dart run tools/translate.dart "Welcome back!"
    ''');
    exit(0);
  }

  final inputText = args.join(' ');
  await addTranslation(inputText);

  // تشغيل slang لتوليد الكلاسات (لو بتستخدم slang)
  print('⚙️ Running slang build_runner...');
  final result = await Process.run('dart', ['run', 'slang']);

  if (result.exitCode == 0) {
    print('✅ slang build completed successfully!\n');
  } else {
    print('❌ slang build failed:');
    print(result.stderr);
  }

  exit(0);
}
