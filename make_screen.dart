import 'dart:developer';
import 'dart:io';

void main(List<String> args) async {
  if (args.isEmpty) {
    log('❌ Usage: dart make_screen.dart <screen_name>');
    exit(1);
  }

  final screenName = args.first;
  final pascalName = _toPascalCase(screenName);
  final folderPath = 'lib/app/features/$screenName';

  // Create folders
  if (args.length == 1) {
    await Directory('$folderPath/data/models').create(recursive: true);
    await Directory('$folderPath/data/service').create(recursive: true);
    await Directory(
      '$folderPath/presentation/controller',
    ).create(recursive: true);
    await Directory('$folderPath/presentation/widgets').create(recursive: true);
    await Directory('$folderPath/presentation/screens').create(recursive: true);

    // Files paths
    final screenFile = File(
      '$folderPath/presentation/screens/${screenName}_screen.dart',
    );

    // Write template files
    await createTemplate(screenFile, pascalName, screenName);

    log('✅ Screen "$screenName" created successfully!');
  }
}

Future<void> createTemplate(
  File screenFile,
  String pascalName,
  String screenName,
) async {
  // Write screen_name_screen.dart
  await screenFile.writeAsString('''
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ${pascalName}Screen extends StatelessWidget {
  const ${pascalName}Screen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('$pascalName Screen')),
      body: Center(
        child: Text(
          '$pascalName Screen Body',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


''');
}

String _toPascalCase(String text) {
  return text
      .split('_')
      .map((word) => word[0].toUpperCase() + word.substring(1))
      .join();
}
