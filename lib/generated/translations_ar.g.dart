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
	@override String get phoneNumber => 'رقم الهاتف';
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
	@override String get next => 'التالي';
	@override String get skip => 'تخطي';
	@override late final _TranslationsOnboardingAr onboarding = _TranslationsOnboardingAr._(_root);
	@override String get chooseYourRole => 'اختر دورك';
	@override String get client => 'عميل';
	@override String get staff => 'الموظفون';
	@override String get clientDescription => 'استمتع بتجربة حجز سلسة مع أفضل مقدمي الخدمات في منطقتك.';
	@override String get staffDescription => 'قم بإدارة حجوزاتك بسهولة وتوسيع نطاق وصولك إلى العملاء.';
	@override String get kContinue => 'استمر';
	@override String get getStarted => 'ابدأ الآن';
	@override String get createAnAccountOrLogInToExploreAboutOurApp => 'أنشئ حسابًا أو سجّل الدخول لاستكشاف تطبيقنا';
	@override String get login => 'تسجيل الدخول';
	@override String get signUp => 'التسجيل';
	@override String get email => 'البريد الإلكتروني';
	@override String get password => 'كلمة المرور';
	@override String get rememberMe => 'تذكرني';
	@override String get forgotPassword => 'نسيت كلمة المرور';
	@override String get continueWithGoogle => 'تابع مع Google';
	@override String get or => 'أو';
	@override String get fullName => 'الاسم الكامل';
	@override String get fullNameRequired => 'الاسم الكامل مطلوب';
	@override String get enterYourFullName => 'أدخل اسمك الكامل';
	@override String get emailRequired => 'البريد الإلكتروني مطلوب';
	@override String get enterYourEmail => 'أدخل بريدك الإلكتروني';
	@override String get passwordRequired => 'كلمة المرور مطلوبة';
	@override String get enterYourPassword => 'أدخل كلمة المرور';
	@override String get fullNameShouldBeAtLeastTwoWords => 'يجب أن يكون الاسم الكامل مكونًا من كلمتين على الأقل';
	@override String get youForgotThisField => 'لقد نسيت هذا الحقل';
	@override String get emailIsNotValid => 'البريد الإلكتروني غير صحيح';
	@override String get passwordShouldBeAtLeast8 => 'يجب أن تكون كلمة المرور مكونة من 8 أحرف على الأقل';
	@override String get passwordShouldContainAtLeastOneCharacter => 'يجب أن تحتوي كلمة المرور على حرف واحد على الأقل';
	@override String get passwordShouldContainAtLeastOneNumber => 'يجب أن تحتوي كلمة المرور على رقم واحد على الأقل';
	@override String get confirmPassword => 'تأكيد كلمة المرور';
	@override String get passwordsDoNotMatch => 'كلمة المرور غير متطابقة';
	@override String get endTimeMustBeAfterStartTime => 'يجب أن يكون وقت الانتهاء بعد وقت البدء';
	@override String get phoneNumberRequired => 'رقم الهاتف مطلوب';
	@override String get byCreatingAnAccountYouAgreeToTheTermsOfUse => 'من خلال إنشاء حساب، فإنك توافق على شروط الاستخدام.';
	@override String get alreadyHaveAnAccount => 'بالفعل لديك حساب؟';
	@override String get signUpWithGoogle => 'التسجيل باستخدام Google';
	@override String get resetPassword => 'إعادة تعيين كلمة المرور';
	@override String get enterYourEmailAddressAndWeWillSendYouALinkToResetYourPassword => 'أدخل عنوان بريدك الإلكتروني وسنرسل لك رابطًا لإعادة تعيين كلمة المرور.';
	@override String get sendCode => 'إرسال الرمز';
	@override String get checkYouEmail => 'تحقق من بريدك الإلكتروني';
	@override String weSentAResetLinkToEmailEnter6DigitCodeThatMentionedInTheEmail({required Object email}) => 'لقد أرسلنا رابط إعادة تعيين كلمة المرور إلى ${email}, أدخل رمز الستة الأرقام المذكورة في البريد الإلكتروني.';
	@override String get didNotReceiveTheCode => 'لم تستلم الرمز؟';
	@override String get resendCode => 'إعادة إرسال الرمز';
	@override String get verifyCode => 'تحقق من الرمز';
	@override String get setNewPassword => 'تعيين كلمة مرور جديدة';
	@override String get updatePassword => 'تحديث كلمة المرور';
	@override String get newPassword => 'كلمة مرور جديدة';
	@override String get yourIdentityHasBeenSuccessfullyVerifiedPleaseEnterANewPasswordToSecureYourAccount => 'تم التحقق من هويتك بنجاح. يرجى إدخال كلمة مرور جديدة لتأمين حسابك.';
	@override String get passwordUpdatedSuccessfully => 'تم تحديث كلمة المرور بنجاح';
	@override String get enter6DigitCode => 'أدخل رمز مكون من 6 أرقام';
	@override String get weSentVerificationCodeToYourEmail => 'لقد أرسلنا رمز التحقق إلى بريدك الإلكتروني';
	@override String get weSentVerificationCodeToYourPhone => 'لقد أرسلنا رمز التحقق إلى هاتفك';
	@override String get haventGotTheCodeYet => 'لم تحصل على الرمز بعد؟';
	@override String get remaining => 'المتبقي';
	@override String get resendCodeIn => 'إعادة إرسال الرمز في';
	@override String get seconds => 'ثانية';
	@override String get pleaseEnterValidOtp => 'يرجى إدخال رمز OTP صالح';
	@override String get accountCreatedSuccessfully => 'تم إنشاء الحساب بنجاح';
	@override String get loginSuccessfuly => 'تم تسجيل الدخول بنجاح';
	@override String get home => 'الرئيسية';
	@override String get goodMorning => 'صباح الخير،';
	@override String get searchServicesProviders => 'ابحث عن خدمات، مزودين...';
	@override String get limitedTime => 'وقت محدود!';
	@override String get getSpecialDiscountInToday => 'احصل على خصم خاص اليوم';
	@override String get upTo => 'حتى';
	@override String get allServicesAvailable => 'جميع الخدمات متاحة || 16 ساعة واليوم';
	@override String get claimNow => 'اطلب الآن';
	@override String get categories => 'الفئات';
	@override String get nearbyProviders => 'مزودون قريبون';
	@override String get viewAll => 'عرض الكل';
	@override String get rating => 'التقييم';
	@override String get earned => 'المكتسب';
	@override String get rate => 'السعر';
	@override String get getInTouch => 'تواصل معنا';
	@override String get explore => 'استكشاف';
	@override String get bookings => 'الحجوزات';
	@override String get offers => 'العروض';
	@override String get settings => 'الإعدادات';
	@override String get pending => 'قيد الانتظار';
	@override String get upcoming => 'القادمة';
	@override String get complete => 'مكتملة';
	@override String get waitingForPayment => 'في انتظار الدفع';
	@override String get totalPaid => 'إجمالي المدفوع';
	@override String get confirmed => 'مؤكدة';
	@override String get contact => 'اتصل';
	@override String get directions => 'الاتجاهات';
	@override String get pay => 'الدفع';
	@override String get reschedule => 'إعادة الجدولة';
	@override String get cancelBookingTitle => 'هل أنت متأكد من أنك تريد إلغاء حجزك بشكل دائم؟';
	@override String get deleteBookingTitle => 'هل أنت متأكد من أنك تريد حذف حجزك بشكل دائم؟';
	@override String get cancelBookingMessage => 'من خلال القيام بذلك، سيتم إلغاء إشعاراتك بشكل دائم ولن تتمكن من استعادة إشعاراتك بعد الآن.';
	@override String get noBookingsYet => 'لا توجد حجوزات بعد';
	@override String get kWith => 'مع';
	@override String get minutes => 'دقيقة';
	@override String get notifications => 'الإشعارات';
	@override String get today => 'اليوم';
	@override String get yesterday => 'الأمس';
	@override String get older => 'الأقدم';
	@override String get markAsRead => 'تحديد كمقروء';
	@override String get noNotifications => 'لا توجد إشعارات حتى الآن';
	@override String get changeLanguage => 'تغيير اللغة';
	@override String get availableNearYou => 'متوفر بالقرب منك';
	@override String get topOffers => 'أفضل العروض';
	@override String get availableOffers => 'العروض المتاحة';
	@override String get allServices => 'جميع الخدمات';
	@override String get spas => 'السبا';
	@override String get clinics => 'العيادات';
	@override String get barbers => 'الحلاقين';
	@override String get somethingHappenedError => 'حدث خطأ ما';
	@override String get availableServices => 'الخدمات المتاحة';
	@override String get description => 'الوصف';
	@override String get readMore => 'اقرأ المزيد';
	@override String get review => 'مراجعة';
	@override String get seeAll => 'عرض الكل';
	@override String get totalPrice => 'السعر الإجمالي';
	@override String get bookingNow => 'احجز الآن';
	@override String get owner => 'المالك';
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

// Path: onboarding
class _TranslationsOnboardingAr implements TranslationsOnboardingEn {
	_TranslationsOnboardingAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get getStarted => 'ابدأ الآن';
	@override String get doctorTitle => 'ابحث عن أطباء موثوقين';
	@override String get doctorSubtitle => 'إبحث واحجز المواعيد مع أفضل الأطباء.';
	@override String get barberTitle => 'اكتشف حلاقين محترفين';
	@override String get barberSubtitle => 'احجز المواعيد مع أفضل الحلاقين في المدينة.';
	@override String get spaTitle => 'استرخ واستعد حيويتك';
	@override String get spaSubtitle => 'احجز سبا فاخرة مصممة خصيصًا لراحتك.';
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
			'phoneNumber' => 'رقم الهاتف',
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
			'next' => 'التالي',
			'skip' => 'تخطي',
			'onboarding.getStarted' => 'ابدأ الآن',
			'onboarding.doctorTitle' => 'ابحث عن أطباء موثوقين',
			'onboarding.doctorSubtitle' => 'إبحث واحجز المواعيد مع أفضل الأطباء.',
			'onboarding.barberTitle' => 'اكتشف حلاقين محترفين',
			'onboarding.barberSubtitle' => 'احجز المواعيد مع أفضل الحلاقين في المدينة.',
			'onboarding.spaTitle' => 'استرخ واستعد حيويتك',
			'onboarding.spaSubtitle' => 'احجز سبا فاخرة مصممة خصيصًا لراحتك.',
			'chooseYourRole' => 'اختر دورك',
			'client' => 'عميل',
			'staff' => 'الموظفون',
			'clientDescription' => 'استمتع بتجربة حجز سلسة مع أفضل مقدمي الخدمات في منطقتك.',
			'staffDescription' => 'قم بإدارة حجوزاتك بسهولة وتوسيع نطاق وصولك إلى العملاء.',
			'kContinue' => 'استمر',
			'getStarted' => 'ابدأ الآن',
			'createAnAccountOrLogInToExploreAboutOurApp' => 'أنشئ حسابًا أو سجّل الدخول لاستكشاف تطبيقنا',
			'login' => 'تسجيل الدخول',
			'signUp' => 'التسجيل',
			'email' => 'البريد الإلكتروني',
			'password' => 'كلمة المرور',
			'rememberMe' => 'تذكرني',
			'forgotPassword' => 'نسيت كلمة المرور',
			'continueWithGoogle' => 'تابع مع Google',
			'or' => 'أو',
			'fullName' => 'الاسم الكامل',
			'fullNameRequired' => 'الاسم الكامل مطلوب',
			'enterYourFullName' => 'أدخل اسمك الكامل',
			'emailRequired' => 'البريد الإلكتروني مطلوب',
			'enterYourEmail' => 'أدخل بريدك الإلكتروني',
			'passwordRequired' => 'كلمة المرور مطلوبة',
			'enterYourPassword' => 'أدخل كلمة المرور',
			'fullNameShouldBeAtLeastTwoWords' => 'يجب أن يكون الاسم الكامل مكونًا من كلمتين على الأقل',
			'youForgotThisField' => 'لقد نسيت هذا الحقل',
			'emailIsNotValid' => 'البريد الإلكتروني غير صحيح',
			'passwordShouldBeAtLeast8' => 'يجب أن تكون كلمة المرور مكونة من 8 أحرف على الأقل',
			'passwordShouldContainAtLeastOneCharacter' => 'يجب أن تحتوي كلمة المرور على حرف واحد على الأقل',
			'passwordShouldContainAtLeastOneNumber' => 'يجب أن تحتوي كلمة المرور على رقم واحد على الأقل',
			'confirmPassword' => 'تأكيد كلمة المرور',
			'passwordsDoNotMatch' => 'كلمة المرور غير متطابقة',
			'endTimeMustBeAfterStartTime' => 'يجب أن يكون وقت الانتهاء بعد وقت البدء',
			'phoneNumberRequired' => 'رقم الهاتف مطلوب',
			'byCreatingAnAccountYouAgreeToTheTermsOfUse' => 'من خلال إنشاء حساب، فإنك توافق على شروط الاستخدام.',
			'alreadyHaveAnAccount' => 'بالفعل لديك حساب؟',
			'signUpWithGoogle' => 'التسجيل باستخدام Google',
			'resetPassword' => 'إعادة تعيين كلمة المرور',
			'enterYourEmailAddressAndWeWillSendYouALinkToResetYourPassword' => 'أدخل عنوان بريدك الإلكتروني وسنرسل لك رابطًا لإعادة تعيين كلمة المرور.',
			'sendCode' => 'إرسال الرمز',
			'checkYouEmail' => 'تحقق من بريدك الإلكتروني',
			'weSentAResetLinkToEmailEnter6DigitCodeThatMentionedInTheEmail' => ({required Object email}) => 'لقد أرسلنا رابط إعادة تعيين كلمة المرور إلى ${email}, أدخل رمز الستة الأرقام المذكورة في البريد الإلكتروني.',
			'didNotReceiveTheCode' => 'لم تستلم الرمز؟',
			'resendCode' => 'إعادة إرسال الرمز',
			'verifyCode' => 'تحقق من الرمز',
			'setNewPassword' => 'تعيين كلمة مرور جديدة',
			'updatePassword' => 'تحديث كلمة المرور',
			'newPassword' => 'كلمة مرور جديدة',
			'yourIdentityHasBeenSuccessfullyVerifiedPleaseEnterANewPasswordToSecureYourAccount' => 'تم التحقق من هويتك بنجاح. يرجى إدخال كلمة مرور جديدة لتأمين حسابك.',
			'passwordUpdatedSuccessfully' => 'تم تحديث كلمة المرور بنجاح',
			'enter6DigitCode' => 'أدخل رمز مكون من 6 أرقام',
			'weSentVerificationCodeToYourEmail' => 'لقد أرسلنا رمز التحقق إلى بريدك الإلكتروني',
			'weSentVerificationCodeToYourPhone' => 'لقد أرسلنا رمز التحقق إلى هاتفك',
			'haventGotTheCodeYet' => 'لم تحصل على الرمز بعد؟',
			'remaining' => 'المتبقي',
			'resendCodeIn' => 'إعادة إرسال الرمز في',
			'seconds' => 'ثانية',
			'pleaseEnterValidOtp' => 'يرجى إدخال رمز OTP صالح',
			'accountCreatedSuccessfully' => 'تم إنشاء الحساب بنجاح',
			'loginSuccessfuly' => 'تم تسجيل الدخول بنجاح',
			'home' => 'الرئيسية',
			'goodMorning' => 'صباح الخير،',
			'searchServicesProviders' => 'ابحث عن خدمات، مزودين...',
			'limitedTime' => 'وقت محدود!',
			'getSpecialDiscountInToday' => 'احصل على خصم خاص اليوم',
			'upTo' => 'حتى',
			'allServicesAvailable' => 'جميع الخدمات متاحة || 16 ساعة واليوم',
			'claimNow' => 'اطلب الآن',
			'categories' => 'الفئات',
			'nearbyProviders' => 'مزودون قريبون',
			'viewAll' => 'عرض الكل',
			'rating' => 'التقييم',
			'earned' => 'المكتسب',
			'rate' => 'السعر',
			'getInTouch' => 'تواصل معنا',
			'explore' => 'استكشاف',
			'bookings' => 'الحجوزات',
			'offers' => 'العروض',
			'settings' => 'الإعدادات',
			'pending' => 'قيد الانتظار',
			'upcoming' => 'القادمة',
			'complete' => 'مكتملة',
			'waitingForPayment' => 'في انتظار الدفع',
			'totalPaid' => 'إجمالي المدفوع',
			'confirmed' => 'مؤكدة',
			'contact' => 'اتصل',
			'directions' => 'الاتجاهات',
			'pay' => 'الدفع',
			'reschedule' => 'إعادة الجدولة',
			'cancelBookingTitle' => 'هل أنت متأكد من أنك تريد إلغاء حجزك بشكل دائم؟',
			'deleteBookingTitle' => 'هل أنت متأكد من أنك تريد حذف حجزك بشكل دائم؟',
			'cancelBookingMessage' => 'من خلال القيام بذلك، سيتم إلغاء إشعاراتك بشكل دائم ولن تتمكن من استعادة إشعاراتك بعد الآن.',
			'noBookingsYet' => 'لا توجد حجوزات بعد',
			'kWith' => 'مع',
			'minutes' => 'دقيقة',
			'notifications' => 'الإشعارات',
			'today' => 'اليوم',
			'yesterday' => 'الأمس',
			'older' => 'الأقدم',
			'markAsRead' => 'تحديد كمقروء',
			'noNotifications' => 'لا توجد إشعارات حتى الآن',
			'changeLanguage' => 'تغيير اللغة',
			'availableNearYou' => 'متوفر بالقرب منك',
			'topOffers' => 'أفضل العروض',
			'availableOffers' => 'العروض المتاحة',
			'allServices' => 'جميع الخدمات',
			'spas' => 'السبا',
			'clinics' => 'العيادات',
			'barbers' => 'الحلاقين',
			'somethingHappenedError' => 'حدث خطأ ما',
			'availableServices' => 'الخدمات المتاحة',
			'description' => 'الوصف',
			'readMore' => 'اقرأ المزيد',
			'review' => 'مراجعة',
			'seeAll' => 'عرض الكل',
			'totalPrice' => 'السعر الإجمالي',
			'bookingNow' => 'احجز الآن',
			'owner' => 'المالك',
			_ => null,
		};
	}
}
