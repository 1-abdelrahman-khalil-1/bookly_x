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

	/// en: 'Phone Number'
	String get phoneNumber => 'Phone Number';

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

	/// en: 'Skip'
	String get skip => 'Skip';

	/// en: 'Next'
	String get next => 'Next';

	late final TranslationsOnboardingEn onboarding = TranslationsOnboardingEn._(_root);

	/// en: 'Choose your role'
	String get chooseYourRole => 'Choose your role';

	/// en: 'Client'
	String get client => 'Client';

	/// en: 'Staff'
	String get staff => 'Staff';

	/// en: 'Enjoy a seamless booking experience with the best service providers in your area.'
	String get clientDescription => 'Enjoy a seamless booking experience with the best service providers in your area.';

	/// en: 'Manage your bookings effortlessly and expand your reach to customers.'
	String get staffDescription => 'Manage your bookings effortlessly and expand your reach to customers.';

	/// en: 'Continue'
	String get kContinue => 'Continue';

	/// en: 'Get Started Now'
	String get getStarted => 'Get Started Now';

	/// en: 'Create an account or log in to explore about our app'
	String get createAnAccountOrLogInToExploreAboutOurApp => 'Create an account or log in to explore about our app';

	/// en: 'Log In'
	String get login => 'Log In';

	/// en: 'Sign Up'
	String get signUp => 'Sign Up';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Remember Me'
	String get rememberMe => 'Remember Me';

	/// en: 'Forgot Password?'
	String get forgotPassword => 'Forgot Password?';

	/// en: 'Continue with Google'
	String get continueWithGoogle => 'Continue with Google';

	/// en: 'OR'
	String get or => 'OR';

	/// en: 'Full Name'
	String get fullName => 'Full Name';

	/// en: 'Full Name Required'
	String get fullNameRequired => 'Full Name Required';

	/// en: 'Enter your full name'
	String get enterYourFullName => 'Enter your full name';

	/// en: 'Email Required'
	String get emailRequired => 'Email Required';

	/// en: 'Enter Your Email'
	String get enterYourEmail => 'Enter Your Email';

	/// en: 'Password Required'
	String get passwordRequired => 'Password Required';

	/// en: 'Enter Your Password'
	String get enterYourPassword => 'Enter Your Password';

	/// en: 'Full Name Should Be At Least Two Words'
	String get fullNameShouldBeAtLeastTwoWords => 'Full Name Should Be At Least Two Words';

	/// en: 'You Forgot This Field'
	String get youForgotThisField => 'You Forgot This Field';

	/// en: 'Email Is Not Valid'
	String get emailIsNotValid => 'Email Is Not Valid';

	/// en: 'Password Should Be At Least 8 '
	String get passwordShouldBeAtLeast8 => 'Password Should Be At Least 8 ';

	/// en: 'Password Should Contain At Least One Character'
	String get passwordShouldContainAtLeastOneCharacter => 'Password Should Contain At Least One Character';

	/// en: 'Password Should Contain At Least One Number'
	String get passwordShouldContainAtLeastOneNumber => 'Password Should Contain At Least One Number';

	/// en: 'Confirm Password'
	String get confirmPassword => 'Confirm Password';

	/// en: 'Passwords Do Not Match'
	String get passwordsDoNotMatch => 'Passwords Do Not Match';

	/// en: 'End Time Must Be After Start Time'
	String get endTimeMustBeAfterStartTime => 'End Time Must Be After Start Time';

	/// en: 'Phone Number Required'
	String get phoneNumberRequired => 'Phone Number Required';

	/// en: 'By creating an account, you agree to the Terms of use'
	String get byCreatingAnAccountYouAgreeToTheTermsOfUse => 'By creating an account, you agree to the Terms of use';

	/// en: 'Already have an account?'
	String get alreadyHaveAnAccount => 'Already have an account?';

	/// en: 'Sign Up With Google'
	String get signUpWithGoogle => 'Sign Up With Google';

	/// en: 'Reset Password'
	String get resetPassword => 'Reset Password';

	/// en: 'Enter your email address and we will send you a link to reset your password.'
	String get enterYourEmailAddressAndWeWillSendYouALinkToResetYourPassword => 'Enter your email address and we will send you a link to reset your password.';

	/// en: 'Send Code'
	String get sendCode => 'Send Code';

	/// en: 'Check you email'
	String get checkYouEmail => 'Check you email';

	/// en: 'We sent a reset link to {{email}}, Enter 6 digit code that mentioned in the email'
	String weSentAResetLinkToEmailEnter6DigitCodeThatMentionedInTheEmail({required Object email}) => 'We sent a reset link to ${email}, Enter 6 digit code that mentioned in the email';

	/// en: 'Did Not Receive The Code?'
	String get didNotReceiveTheCode => 'Did Not Receive The Code?';

	/// en: 'Resend Code'
	String get resendCode => 'Resend Code';

	/// en: 'Verify Code'
	String get verifyCode => 'Verify Code';

	/// en: 'Set New Password'
	String get setNewPassword => 'Set New Password';

	/// en: 'Update Password'
	String get updatePassword => 'Update Password';

	/// en: 'New Password'
	String get newPassword => 'New Password';

	/// en: 'Your identity has been successfully verified. Please enter a new password to secure your account.'
	String get yourIdentityHasBeenSuccessfullyVerifiedPleaseEnterANewPasswordToSecureYourAccount => 'Your identity has been successfully verified. Please enter a new password to secure your account.';

	/// en: 'Password Updated Successfully'
	String get passwordUpdatedSuccessfully => 'Password Updated Successfully';

	/// en: 'Enter 6-digit code'
	String get enter6DigitCode => 'Enter 6-digit code';

	/// en: 'We sent a verification code to your email'
	String get weSentVerificationCodeToYourEmail => 'We sent a verification code to your email';

	/// en: 'We sent a verification code to your phone'
	String get weSentVerificationCodeToYourPhone => 'We sent a verification code to your phone';

	/// en: 'Haven't got the code yet?'
	String get haventGotTheCodeYet => 'Haven\'t got the code yet?';

	/// en: 'remaining'
	String get remaining => 'remaining';

	/// en: 'Resend code in'
	String get resendCodeIn => 'Resend code in';

	/// en: 'seconds'
	String get seconds => 'seconds';

	/// en: 'Please Enter Valid Otp'
	String get pleaseEnterValidOtp => 'Please Enter Valid Otp';

	/// en: 'Account Created Successfully'
	String get accountCreatedSuccessfully => 'Account Created Successfully';

	/// en: 'Login Successfuly'
	String get loginSuccessfuly => 'Login Successfuly';

	/// en: 'Home'
	String get home => 'Home';

	/// en: 'Good morning,'
	String get goodMorning => 'Good morning,';

	/// en: 'Search services, providers...'
	String get searchServicesProviders => 'Search services, providers...';

	/// en: 'Limited time!'
	String get limitedTime => 'Limited time!';

	/// en: 'Get Special Discount in today'
	String get getSpecialDiscountInToday => 'Get Special Discount in today';

	/// en: 'Up to'
	String get upTo => 'Up to';

	/// en: 'All services Available || 16 hours & today'
	String get allServicesAvailable => 'All services Available || 16 hours & today';

	/// en: 'Claim Now'
	String get claimNow => 'Claim Now';

	/// en: 'Categories'
	String get categories => 'Categories';

	/// en: 'Nearby Providers'
	String get nearbyProviders => 'Nearby Providers';

	/// en: 'View All'
	String get viewAll => 'View All';

	/// en: 'Rating'
	String get rating => 'Rating';

	/// en: 'Earned'
	String get earned => 'Earned';

	/// en: 'Rate'
	String get rate => 'Rate';

	/// en: 'Get In Touch'
	String get getInTouch => 'Get In Touch';

	/// en: 'Explore'
	String get explore => 'Explore';

	/// en: 'Bookings'
	String get bookings => 'Bookings';

	/// en: 'Offers'
	String get offers => 'Offers';

	/// en: 'Settings'
	String get settings => 'Settings';

	/// en: 'Pending'
	String get pending => 'Pending';

	/// en: 'Upcoming'
	String get upcoming => 'Upcoming';

	/// en: 'Complete'
	String get complete => 'Complete';

	/// en: 'Waiting for payment'
	String get waitingForPayment => 'Waiting for payment';

	/// en: 'Total Paid'
	String get totalPaid => 'Total Paid';

	/// en: 'Confirmed'
	String get confirmed => 'Confirmed';

	/// en: 'Contact'
	String get contact => 'Contact';

	/// en: 'Directions'
	String get directions => 'Directions';

	/// en: 'Pay'
	String get pay => 'Pay';

	/// en: 'Reschedule'
	String get reschedule => 'Reschedule';

	/// en: 'Are you sure you want to Cancel your Booking permanently?'
	String get cancelBookingTitle => 'Are you sure you want to Cancel your Booking permanently?';

	/// en: 'Are you sure you want to Delete your Booking permanently?'
	String get deleteBookingTitle => 'Are you sure you want to Delete your Booking permanently?';

	/// en: 'By doing this, your booking will be cancelled permanently and you will not be able to recover your booking anymore.'
	String get cancelBookingMessage => 'By doing this, your booking will be cancelled permanently and you will not be able to recover your booking anymore.';

	/// en: 'No bookings yet'
	String get noBookingsYet => 'No bookings yet';

	/// en: 'With'
	String get kWith => 'With';

	/// en: 'min'
	String get minutes => 'min';

	/// en: 'Notifications'
	String get notifications => 'Notifications';

	/// en: 'Today'
	String get today => 'Today';

	/// en: 'Yesterday'
	String get yesterday => 'Yesterday';

	/// en: 'Older'
	String get older => 'Older';

	/// en: 'Mark as read'
	String get markAsRead => 'Mark as read';

	/// en: 'No notifications yet'
	String get noNotifications => 'No notifications yet';

	/// en: 'Change Language'
	String get changeLanguage => 'Change Language';

	/// en: 'Available Near You'
	String get availableNearYou => 'Available Near You';

	/// en: 'Top Offers'
	String get topOffers => 'Top Offers';

	/// en: 'Available Offers'
	String get availableOffers => 'Available Offers';

	/// en: 'All Services'
	String get allServices => 'All Services';

	/// en: 'Spas'
	String get spas => 'Spas';

	/// en: 'Clinics'
	String get clinics => 'Clinics';

	/// en: 'Barbers'
	String get barbers => 'Barbers';

	/// en: 'Something Happened Error'
	String get somethingHappenedError => 'Something Happened Error';
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

// Path: onboarding
class TranslationsOnboardingEn {
	TranslationsOnboardingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

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
			'phoneNumber' => 'Phone Number',
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
			'skip' => 'Skip',
			'next' => 'Next',
			'onboarding.getStarted' => 'Get Started',
			'onboarding.doctorTitle' => 'Find Trusted Doctors',
			'onboarding.doctorSubtitle' => 'Search and book appointments with top-rated doctors.',
			'onboarding.barberTitle' => 'Discover Professional Barbers',
			'onboarding.barberSubtitle' => 'Book appointments with the best barbers in town.',
			'onboarding.spaTitle' => 'Relax and Rejuvenate',
			'onboarding.spaSubtitle' => 'Book premium spa experiences designed for your comfort.',
			'chooseYourRole' => 'Choose your role',
			'client' => 'Client',
			'staff' => 'Staff',
			'clientDescription' => 'Enjoy a seamless booking experience with the best service providers in your area.',
			'staffDescription' => 'Manage your bookings effortlessly and expand your reach to customers.',
			'kContinue' => 'Continue',
			'getStarted' => 'Get Started Now',
			'createAnAccountOrLogInToExploreAboutOurApp' => 'Create an account or log in to explore about our app',
			'login' => 'Log In',
			'signUp' => 'Sign Up',
			'email' => 'Email',
			'password' => 'Password',
			'rememberMe' => 'Remember Me',
			'forgotPassword' => 'Forgot Password?',
			'continueWithGoogle' => 'Continue with Google',
			'or' => 'OR',
			'fullName' => 'Full Name',
			'fullNameRequired' => 'Full Name Required',
			'enterYourFullName' => 'Enter your full name',
			'emailRequired' => 'Email Required',
			'enterYourEmail' => 'Enter Your Email',
			'passwordRequired' => 'Password Required',
			'enterYourPassword' => 'Enter Your Password',
			'fullNameShouldBeAtLeastTwoWords' => 'Full Name Should Be At Least Two Words',
			'youForgotThisField' => 'You Forgot This Field',
			'emailIsNotValid' => 'Email Is Not Valid',
			'passwordShouldBeAtLeast8' => 'Password Should Be At Least 8 ',
			'passwordShouldContainAtLeastOneCharacter' => 'Password Should Contain At Least One Character',
			'passwordShouldContainAtLeastOneNumber' => 'Password Should Contain At Least One Number',
			'confirmPassword' => 'Confirm Password',
			'passwordsDoNotMatch' => 'Passwords Do Not Match',
			'endTimeMustBeAfterStartTime' => 'End Time Must Be After Start Time',
			'phoneNumberRequired' => 'Phone Number Required',
			'byCreatingAnAccountYouAgreeToTheTermsOfUse' => 'By creating an account, you agree to the Terms of use',
			'alreadyHaveAnAccount' => 'Already have an account?',
			'signUpWithGoogle' => 'Sign Up With Google',
			'resetPassword' => 'Reset Password',
			'enterYourEmailAddressAndWeWillSendYouALinkToResetYourPassword' => 'Enter your email address and we will send you a link to reset your password.',
			'sendCode' => 'Send Code',
			'checkYouEmail' => 'Check you email',
			'weSentAResetLinkToEmailEnter6DigitCodeThatMentionedInTheEmail' => ({required Object email}) => 'We sent a reset link to ${email}, Enter 6 digit code that mentioned in the email',
			'didNotReceiveTheCode' => 'Did Not Receive The Code?',
			'resendCode' => 'Resend Code',
			'verifyCode' => 'Verify Code',
			'setNewPassword' => 'Set New Password',
			'updatePassword' => 'Update Password',
			'newPassword' => 'New Password',
			'yourIdentityHasBeenSuccessfullyVerifiedPleaseEnterANewPasswordToSecureYourAccount' => 'Your identity has been successfully verified. Please enter a new password to secure your account.',
			'passwordUpdatedSuccessfully' => 'Password Updated Successfully',
			'enter6DigitCode' => 'Enter 6-digit code',
			'weSentVerificationCodeToYourEmail' => 'We sent a verification code to your email',
			'weSentVerificationCodeToYourPhone' => 'We sent a verification code to your phone',
			'haventGotTheCodeYet' => 'Haven\'t got the code yet?',
			'remaining' => 'remaining',
			'resendCodeIn' => 'Resend code in',
			'seconds' => 'seconds',
			'pleaseEnterValidOtp' => 'Please Enter Valid Otp',
			'accountCreatedSuccessfully' => 'Account Created Successfully',
			'loginSuccessfuly' => 'Login Successfuly',
			'home' => 'Home',
			'goodMorning' => 'Good morning,',
			'searchServicesProviders' => 'Search services, providers...',
			'limitedTime' => 'Limited time!',
			'getSpecialDiscountInToday' => 'Get Special Discount in today',
			'upTo' => 'Up to',
			'allServicesAvailable' => 'All services Available || 16 hours & today',
			'claimNow' => 'Claim Now',
			'categories' => 'Categories',
			'nearbyProviders' => 'Nearby Providers',
			'viewAll' => 'View All',
			'rating' => 'Rating',
			'earned' => 'Earned',
			'rate' => 'Rate',
			'getInTouch' => 'Get In Touch',
			'explore' => 'Explore',
			'bookings' => 'Bookings',
			'offers' => 'Offers',
			'settings' => 'Settings',
			'pending' => 'Pending',
			'upcoming' => 'Upcoming',
			'complete' => 'Complete',
			'waitingForPayment' => 'Waiting for payment',
			'totalPaid' => 'Total Paid',
			'confirmed' => 'Confirmed',
			'contact' => 'Contact',
			'directions' => 'Directions',
			'pay' => 'Pay',
			'reschedule' => 'Reschedule',
			'cancelBookingTitle' => 'Are you sure you want to Cancel your Booking permanently?',
			'deleteBookingTitle' => 'Are you sure you want to Delete your Booking permanently?',
			'cancelBookingMessage' => 'By doing this, your booking will be cancelled permanently and you will not be able to recover your booking anymore.',
			'noBookingsYet' => 'No bookings yet',
			'kWith' => 'With',
			'minutes' => 'min',
			'notifications' => 'Notifications',
			'today' => 'Today',
			'yesterday' => 'Yesterday',
			'older' => 'Older',
			'markAsRead' => 'Mark as read',
			'noNotifications' => 'No notifications yet',
			'changeLanguage' => 'Change Language',
			'availableNearYou' => 'Available Near You',
			'topOffers' => 'Top Offers',
			'availableOffers' => 'Available Offers',
			'allServices' => 'All Services',
			'spas' => 'Spas',
			'clinics' => 'Clinics',
			'barbers' => 'Barbers',
			'somethingHappenedError' => 'Something Happened Error',
			_ => null,
		};
	}
}
