///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsAr with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsAr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsAr _root = this; // ignore: unused_field

	@override 
	TranslationsAr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsAr(meta: meta ?? this.$meta);

	// Translations
	@override String get errorOccurred => 'حدث خطأ';
	@override String get somethingWentWrong => 'حدث خطأ ما';
	@override String get noInternet => 'لا توجد اتصالات انترنت';
	@override String get checkInternetConnection => 'يرجى التحقق من اتصالك بالإنترنت';
	@override String get tryAgain => 'حاول مرة أخرى';
	@override String get loading => 'جاري التحميل';
	@override String get seeMore => 'شاهد المزيد';
	@override String get search => 'بحث';
	@override String get noResultsFound => 'لم يتم العثور على نتائج';
	@override String get male => 'ذكر';
	@override String get female => 'أنثى';
	@override late final _TranslationsWeekdaysAr weekdays = _TranslationsWeekdaysAr._(_root);
	@override String get disconnected => 'غير متصل';
	@override String get connected => 'متصل';
	@override String get internetWeak => 'اتصال انترنت ضعيف';
	@override String get aServerErrorOccurred => 'حدث خطأ في الخادم';
	@override String get somethingWentWrongWithTheServerPleaseTryAgainLater => 'حدث خطأ ما في الخادم. يرجى المحاولة لاحقًا.';
	@override String get noInternetConnection => 'لا توجد اتصالات انترنت';
	@override String get noInternetConnectionSubtitle => 'يرجى التحقق من اتصالك بالإنترنت والمحاولة مرة أخرى';
	@override String get pleaseSelect => 'يرجى الاختيار';
	@override String get close => 'إغلاق';
	@override String get searchAndSelect => 'البحث والاختيار';
	@override late final _TranslationsFieldNamesAr fieldNames = _TranslationsFieldNamesAr._(_root);
	@override String get enterYourPhoneNumber => 'أدخل رقم هاتفك';
	@override String get pleaseEnterAValidPhone => 'يرجى إدخال رقم هاتف صحيح';
	@override String get searchCountry => 'البحث عن دولة';
	@override String get enter => 'أدخل';
	@override String get camera => 'الكاميرا';
	@override String get gallery => 'المعرض';
	@override String get selectImageToUpload => 'اختر صورة للتحميل';
	@override String get imageAllowedFormats => 'صيغ الصور المسموح بها';
	@override String get submit => 'إرسال';
	@override String get cancel => 'إلغاء';
	@override String get delete => 'حذف';
	@override String get edit => 'تعديل';
	@override String get save => 'حفظ';
	@override String get done => 'تم';
	@override String get ok => 'حسنا';
	@override String get failed => 'فشل';
	@override String get success => 'نجح';
	@override String get warning => 'تحذير';
	@override String get error => 'خطأ';
	@override String get info => 'معلومات';
}

// Path: weekdays
class _TranslationsWeekdaysAr implements TranslationsWeekdaysEn {
	_TranslationsWeekdaysAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get monday => 'الإثنين';
	@override String get tuesday => 'الثلاثاء';
	@override String get wednesday => 'الأربعاء';
	@override String get thursday => 'الخميس';
	@override String get friday => 'الجمعة';
	@override String get saturday => 'السبت';
	@override String get sunday => 'الأحد';
}

// Path: fieldNames
class _TranslationsFieldNamesAr implements TranslationsFieldNamesEn {
	_TranslationsFieldNamesAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get phoneNumber => 'رقم الهاتف';
}

/// The flat map containing all translations for locale <ar>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsAr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'errorOccurred' => 'حدث خطأ',
			'somethingWentWrong' => 'حدث خطأ ما',
			'noInternet' => 'لا توجد اتصالات انترنت',
			'checkInternetConnection' => 'يرجى التحقق من اتصالك بالإنترنت',
			'tryAgain' => 'حاول مرة أخرى',
			'loading' => 'جاري التحميل',
			'seeMore' => 'شاهد المزيد',
			'search' => 'بحث',
			'noResultsFound' => 'لم يتم العثور على نتائج',
			'male' => 'ذكر',
			'female' => 'أنثى',
			'weekdays.monday' => 'الإثنين',
			'weekdays.tuesday' => 'الثلاثاء',
			'weekdays.wednesday' => 'الأربعاء',
			'weekdays.thursday' => 'الخميس',
			'weekdays.friday' => 'الجمعة',
			'weekdays.saturday' => 'السبت',
			'weekdays.sunday' => 'الأحد',
			'disconnected' => 'غير متصل',
			'connected' => 'متصل',
			'internetWeak' => 'اتصال انترنت ضعيف',
			'aServerErrorOccurred' => 'حدث خطأ في الخادم',
			'somethingWentWrongWithTheServerPleaseTryAgainLater' => 'حدث خطأ ما في الخادم. يرجى المحاولة لاحقًا.',
			'noInternetConnection' => 'لا توجد اتصالات انترنت',
			'noInternetConnectionSubtitle' => 'يرجى التحقق من اتصالك بالإنترنت والمحاولة مرة أخرى',
			'pleaseSelect' => 'يرجى الاختيار',
			'close' => 'إغلاق',
			'searchAndSelect' => 'البحث والاختيار',
			'fieldNames.phoneNumber' => 'رقم الهاتف',
			'enterYourPhoneNumber' => 'أدخل رقم هاتفك',
			'pleaseEnterAValidPhone' => 'يرجى إدخال رقم هاتف صحيح',
			'searchCountry' => 'البحث عن دولة',
			'enter' => 'أدخل',
			'camera' => 'الكاميرا',
			'gallery' => 'المعرض',
			'selectImageToUpload' => 'اختر صورة للتحميل',
			'imageAllowedFormats' => 'صيغ الصور المسموح بها',
			'submit' => 'إرسال',
			'cancel' => 'إلغاء',
			'delete' => 'حذف',
			'edit' => 'تعديل',
			'save' => 'حفظ',
			'done' => 'تم',
			'ok' => 'حسنا',
			'failed' => 'فشل',
			'success' => 'نجح',
			'warning' => 'تحذير',
			'error' => 'خطأ',
			'info' => 'معلومات',
			_ => null,
		};
	}
}
