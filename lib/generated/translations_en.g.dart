///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final tr = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// en: 'An error occurred'
	String get errorOccurred => 'An error occurred';

	/// en: 'Something went wrong'
	String get somethingWentWrong => 'Something went wrong';

	/// en: 'No Internet Connection'
	String get noInternet => 'No Internet Connection';

	/// en: 'Please check your internet connection'
	String get checkInternetConnection => 'Please check your internet connection';

	/// en: 'Try Again'
	String get tryAgain => 'Try Again';

	/// en: 'Loading'
	String get loading => 'Loading';

	/// en: 'See More'
	String get seeMore => 'See More';

	/// en: 'Search'
	String get search => 'Search';

	/// en: 'No results found'
	String get noResultsFound => 'No results found';

	/// en: 'Male'
	String get male => 'Male';

	/// en: 'Female'
	String get female => 'Female';

	late final TranslationsWeekdaysEn weekdays = TranslationsWeekdaysEn._(_root);

	/// en: 'Disconnected'
	String get disconnected => 'Disconnected';

	/// en: 'Connected'
	String get connected => 'Connected';

	/// en: 'Weak Internet Connection'
	String get internetWeak => 'Weak Internet Connection';

	/// en: 'A server error occurred'
	String get aServerErrorOccurred => 'A server error occurred';

	/// en: 'Something went wrong with the server. Please try again later.'
	String get somethingWentWrongWithTheServerPleaseTryAgainLater => 'Something went wrong with the server. Please try again later.';

	/// en: 'No Internet Connection'
	String get noInternetConnection => 'No Internet Connection';

	/// en: 'Please check your internet connection and try again'
	String get noInternetConnectionSubtitle => 'Please check your internet connection and try again';

	/// en: 'Please select'
	String get pleaseSelect => 'Please select';

	/// en: 'Close'
	String get close => 'Close';

	/// en: 'Search and select'
	String get searchAndSelect => 'Search and select';

	late final TranslationsFieldNamesEn fieldNames = TranslationsFieldNamesEn._(_root);

	/// en: 'Enter your phone number'
	String get enterYourPhoneNumber => 'Enter your phone number';

	/// en: 'Please enter a valid phone number'
	String get pleaseEnterAValidPhone => 'Please enter a valid phone number';

	/// en: 'Search country'
	String get searchCountry => 'Search country';

	/// en: 'Enter'
	String get enter => 'Enter';

	/// en: 'Camera'
	String get camera => 'Camera';

	/// en: 'Gallery'
	String get gallery => 'Gallery';

	/// en: 'Select image to upload'
	String get selectImageToUpload => 'Select image to upload';

	/// en: 'Image allowed formats'
	String get imageAllowedFormats => 'Image allowed formats';

	/// en: 'Submit'
	String get submit => 'Submit';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Edit'
	String get edit => 'Edit';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Done'
	String get done => 'Done';

	/// en: 'Ok'
	String get ok => 'Ok';

	/// en: 'Failed'
	String get failed => 'Failed';

	/// en: 'Success'
	String get success => 'Success';

	/// en: 'Warning'
	String get warning => 'Warning';

	/// en: 'Error'
	String get error => 'Error';

	/// en: 'Info'
	String get info => 'Info';

	late final TranslationsOnboardingEn onboarding = TranslationsOnboardingEn._(_root);
}

// Path: weekdays
class TranslationsWeekdaysEn {
	TranslationsWeekdaysEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Monday'
	String get monday => 'Monday';

	/// en: 'Tuesday'
	String get tuesday => 'Tuesday';

	/// en: 'Wednesday'
	String get wednesday => 'Wednesday';

	/// en: 'Thursday'
	String get thursday => 'Thursday';

	/// en: 'Friday'
	String get friday => 'Friday';

	/// en: 'Saturday'
	String get saturday => 'Saturday';

	/// en: 'Sunday'
	String get sunday => 'Sunday';
}

// Path: fieldNames
class TranslationsFieldNamesEn {
	TranslationsFieldNamesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Phone Number'
	String get phoneNumber => 'Phone Number';
}

// Path: onboarding
class TranslationsOnboardingEn {
	TranslationsOnboardingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Skip'
	String get skip => 'Skip';

	/// en: 'Next'
	String get next => 'Next';

	/// en: 'Get Started'
	String get getStarted => 'Get Started';

	/// en: 'Find Trusted Doctors'
	String get doctorTitle => 'Find Trusted Doctors';

	/// en: 'Search and book appointments with top-rated doctors.'
	String get doctorSubtitle => 'Search and book appointments with top-rated doctors.';

	/// en: 'Discover Professional Barbers'
	String get barberTitle => 'Discover Professional Barbers';

	/// en: 'Book appointments with the best barbers in town.'
	String get barberSubtitle => 'Book appointments with the best barbers in town.';

	/// en: 'Relax and Rejuvenate'
	String get spaTitle => 'Relax and Rejuvenate';

	/// en: 'Book premium spa experiences designed for your comfort.'
	String get spaSubtitle => 'Book premium spa experiences designed for your comfort.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'errorOccurred' => 'An error occurred',
			'somethingWentWrong' => 'Something went wrong',
			'noInternet' => 'No Internet Connection',
			'checkInternetConnection' => 'Please check your internet connection',
			'tryAgain' => 'Try Again',
			'loading' => 'Loading',
			'seeMore' => 'See More',
			'search' => 'Search',
			'noResultsFound' => 'No results found',
			'male' => 'Male',
			'female' => 'Female',
			'weekdays.monday' => 'Monday',
			'weekdays.tuesday' => 'Tuesday',
			'weekdays.wednesday' => 'Wednesday',
			'weekdays.thursday' => 'Thursday',
			'weekdays.friday' => 'Friday',
			'weekdays.saturday' => 'Saturday',
			'weekdays.sunday' => 'Sunday',
			'disconnected' => 'Disconnected',
			'connected' => 'Connected',
			'internetWeak' => 'Weak Internet Connection',
			'aServerErrorOccurred' => 'A server error occurred',
			'somethingWentWrongWithTheServerPleaseTryAgainLater' => 'Something went wrong with the server. Please try again later.',
			'noInternetConnection' => 'No Internet Connection',
			'noInternetConnectionSubtitle' => 'Please check your internet connection and try again',
			'pleaseSelect' => 'Please select',
			'close' => 'Close',
			'searchAndSelect' => 'Search and select',
			'fieldNames.phoneNumber' => 'Phone Number',
			'enterYourPhoneNumber' => 'Enter your phone number',
			'pleaseEnterAValidPhone' => 'Please enter a valid phone number',
			'searchCountry' => 'Search country',
			'enter' => 'Enter',
			'camera' => 'Camera',
			'gallery' => 'Gallery',
			'selectImageToUpload' => 'Select image to upload',
			'imageAllowedFormats' => 'Image allowed formats',
			'submit' => 'Submit',
			'cancel' => 'Cancel',
			'delete' => 'Delete',
			'edit' => 'Edit',
			'save' => 'Save',
			'done' => 'Done',
			'ok' => 'Ok',
			'failed' => 'Failed',
			'success' => 'Success',
			'warning' => 'Warning',
			'error' => 'Error',
			'info' => 'Info',
			'onboarding.skip' => 'Skip',
			'onboarding.next' => 'Next',
			'onboarding.getStarted' => 'Get Started',
			'onboarding.doctorTitle' => 'Find Trusted Doctors',
			'onboarding.doctorSubtitle' => 'Search and book appointments with top-rated doctors.',
			'onboarding.barberTitle' => 'Discover Professional Barbers',
			'onboarding.barberSubtitle' => 'Book appointments with the best barbers in town.',
			'onboarding.spaTitle' => 'Relax and Rejuvenate',
			'onboarding.spaSubtitle' => 'Book premium spa experiences designed for your comfort.',
			_ => null,
		};
	}
}
