// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: 'Text for the skip button on the onboarding screen',
      args: [],
    );
  }

  /// `Stay Connected`
  String get onBoardingTitle1 {
    return Intl.message(
      'Stay Connected',
      name: 'onBoardingTitle1',
      desc: 'Title of the first onboarding screen',
      args: [],
    );
  }

  /// `Instantly chat with friends, family, or colleagues anytime, anywhere.`
  String get onBoardingSubTitle1 {
    return Intl.message(
      'Instantly chat with friends, family, or colleagues anytime, anywhere.',
      name: 'onBoardingSubTitle1',
      desc: 'Subtitle of the first onboarding screen',
      args: [],
    );
  }

  /// `Security & Privacy`
  String get onBoardingTitle2 {
    return Intl.message(
      'Security & Privacy',
      name: 'onBoardingTitle2',
      desc: 'Title of the second onboarding screen',
      args: [],
    );
  }

  /// `Your conversations are encrypted to keep your messages safe and private.`
  String get onBoardingSubTitle2 {
    return Intl.message(
      'Your conversations are encrypted to keep your messages safe and private.',
      name: 'onBoardingSubTitle2',
      desc: 'Subtitle of the second onboarding screen',
      args: [],
    );
  }

  /// `Express Yourself`
  String get onBoardingTitle3 {
    return Intl.message(
      'Express Yourself',
      name: 'onBoardingTitle3',
      desc: 'Title of the third onboarding screen',
      args: [],
    );
  }

  /// `Share photos, voice notes, and emojis to make every chat more fun and personal.`
  String get onBoardingSubTitle3 {
    return Intl.message(
      'Share photos, voice notes, and emojis to make every chat more fun and personal.',
      name: 'onBoardingSubTitle3',
      desc: 'Subtitle of the third onboarding screen',
      args: [],
    );
  }

  /// `Welcome to`
  String get loginTitle {
    return Intl.message(
      'Welcome to',
      name: 'loginTitle',
      desc: 'Main title of the login screen',
      args: [],
    );
  }

  /// `Login to start bonding`
  String get loginSubTitle {
    return Intl.message(
      'Login to start bonding',
      name: 'loginSubTitle',
      desc: 'Subtitle of the login screen',
      args: [],
    );
  }

  /// `Email Address`
  String get emailHint {
    return Intl.message(
      'Email Address',
      name: 'emailHint',
      desc: 'Hint text for the email field on the login screen',
      args: [],
    );
  }

  /// `Password`
  String get passwordHint {
    return Intl.message(
      'Password',
      name: 'passwordHint',
      desc: 'Hint text for the password field on the login screen',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: 'Text for the forgot password option on the login screen',
      args: [],
    );
  }

  /// `Login`
  String get loginButton {
    return Intl.message(
      'Login',
      name: 'loginButton',
      desc: 'Text for the login button on the login screen',
      args: [],
    );
  }

  /// `Or login with`
  String get orLoginWith {
    return Intl.message(
      'Or login with',
      name: 'orLoginWith',
      desc:
          'Text displayed above social media login options on the login screen',
      args: [],
    );
  }

  /// `Don’t have an account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don’t have an account?',
      name: 'dontHaveAnAccount',
      desc:
          'Text prompting users to register if they don\'t have an account on the login screen',
      args: [],
    );
  }

  /// `Register now`
  String get registerNow {
    return Intl.message(
      'Register now',
      name: 'registerNow',
      desc: 'Text for the register button on the login screen',
      args: [],
    );
  }

  /// `Registeration`
  String get registerTitle {
    return Intl.message(
      'Registeration',
      name: 'registerTitle',
      desc: 'Main title of the registration screen',
      args: [],
    );
  }

  /// `Create your account to get started.`
  String get registerSubTitle {
    return Intl.message(
      'Create your account to get started.',
      name: 'registerSubTitle',
      desc: 'Subtitle of the registration screen',
      args: [],
    );
  }

  /// `First Name`
  String get firstNameHint {
    return Intl.message(
      'First Name',
      name: 'firstNameHint',
      desc: 'Hint text for the first name field on the registration screen',
      args: [],
    );
  }

  /// `Last Name`
  String get lastNameHint {
    return Intl.message(
      'Last Name',
      name: 'lastNameHint',
      desc: 'Hint text for the last name field on the registration screen',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPasswordHint {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPasswordHint',
      desc:
          'Hint text for the confirm password field on the registration screen',
      args: [],
    );
  }

  /// `Create Account`
  String get registerButton {
    return Intl.message(
      'Create Account',
      name: 'registerButton',
      desc: 'Text for the register button on the registration screen',
      args: [],
    );
  }

  /// `Or register with`
  String get orRegisterWith {
    return Intl.message(
      'Or register with',
      name: 'orRegisterWith',
      desc:
          'Text displayed above social media registration options on the registration screen',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc:
          'Text prompting users to login if they already have an account on the registration screen',
      args: [],
    );
  }

  /// `Login now`
  String get loginNow {
    return Intl.message(
      'Login now',
      name: 'loginNow',
      desc: 'Text for the login button on the registration screen',
      args: [],
    );
  }

  /// `Your account has been created successfully 🎉`
  String get successfulRegistration {
    return Intl.message(
      'Your account has been created successfully 🎉',
      name: 'successfulRegistration',
      desc: 'Message displayed after successful registration',
      args: [],
    );
  }

  /// ` `
  String get verifyAccountTitle {
    return Intl.message(
      ' ',
      name: 'verifyAccountTitle',
      desc: '',
      args: [],
    );
  }

  /// `تم ارسال الكود الي البريد الالكتروني او رقم الهاتف. ادخل الكود لاستعادة كلمة المرور`
  String get verifyAccountSubTitle {
    return Intl.message(
      'تم ارسال الكود الي البريد الالكتروني او رقم الهاتف. ادخل الكود لاستعادة كلمة المرور',
      name: 'verifyAccountSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Nick Name`
  String get nicknameHint {
    return Intl.message(
      'Nick Name',
      name: 'nicknameHint',
      desc: 'Hint text for the nickname field on the profile setup screen',
      args: [],
    );
  }

  /// `Bio`
  String get bioHint {
    return Intl.message(
      'Bio',
      name: 'bioHint',
      desc: 'Hint text for the bio field on the profile setup screen',
      args: [],
    );
  }

  /// `Complete Profile`
  String get completeProfileButton {
    return Intl.message(
      'Complete Profile',
      name: 'completeProfileButton',
      desc: 'Text for the button to complete profile setup',
      args: [],
    );
  }

  /// `Profile picture updated successfully 🎉`
  String get imageUploadSuccess {
    return Intl.message(
      'Profile picture updated successfully 🎉',
      name: 'imageUploadSuccess',
      desc: 'Message displayed after successfully uploading a profile picture',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgetPasswordTitle {
    return Intl.message(
      'Forgot Password?',
      name: 'forgetPasswordTitle',
      desc: 'Text for the forgot password option on the login screen',
      args: [],
    );
  }

  /// `No worries! Just enter your email and we’ll help you reset your password.`
  String get forgetPasswordSubTitle {
    return Intl.message(
      'No worries! Just enter your email and we’ll help you reset your password.',
      name: 'forgetPasswordSubTitle',
      desc: 'Subtitle for the forgot password screen',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPasswordButton {
    return Intl.message(
      'Reset Password',
      name: 'resetPasswordButton',
      desc: 'Text for the reset password button on the forgot password screen',
      args: [],
    );
  }

  /// `Not received email?`
  String get notReceivedEmail {
    return Intl.message(
      'Not received email?',
      name: 'notReceivedEmail',
      desc:
          'Text prompting users when they have not received the password reset email',
      args: [],
    );
  }

  /// `↺ Resend`
  String get resendEmail {
    return Intl.message(
      '↺ Resend',
      name: 'resendEmail',
      desc: 'Text for the resend email option on the forgot password screen',
      args: [],
    );
  }

  /// `Mail sent`
  String get mailSent {
    return Intl.message(
      'Mail sent',
      name: 'mailSent',
      desc:
          'Message displayed after successfully sending the password reset email',
      args: [],
    );
  }

  /// `successfully!`
  String get successfully {
    return Intl.message(
      'successfully!',
      name: 'successfully',
      desc: 'Text appended to messages indicating successful actions',
      args: [],
    );
  }

  /// `We’ve sent you a link to reset your password. Please check your `
  String get mailSentSubTitle {
    return Intl.message(
      'We’ve sent you a link to reset your password. Please check your ',
      name: 'mailSentSubTitle',
      desc:
          'Subtitle displayed after successfully sending the password reset email',
      args: [],
    );
  }

  /// `inbox.`
  String get inbox {
    return Intl.message(
      'inbox.',
      name: 'inbox',
      desc:
          'Text referring to the user\'s email inbox where they should check for the password reset email',
      args: [],
    );
  }

  /// ` Click the link inside to create a new password and you’ll be back in no time.`
  String get mailSentSubTitle1 {
    return Intl.message(
      ' Click the link inside to create a new password and you’ll be back in no time.',
      name: 'mailSentSubTitle1',
      desc:
          'Subtitle displayed after successfully sending the password reset email',
      args: [],
    );
  }

  /// `🔒 Reset your password`
  String get resetPasswordTitle {
    return Intl.message(
      '🔒 Reset your password',
      name: 'resetPasswordTitle',
      desc: 'Title of the reset password screen',
      args: [],
    );
  }

  /// `No worries! Just enter your email and we’ll help you reset your password.`
  String get resetPasswordSubTitle {
    return Intl.message(
      'No worries! Just enter your email and we’ll help you reset your password.',
      name: 'resetPasswordSubTitle',
      desc: 'Subtitle of the reset password screen',
      args: [],
    );
  }

  /// `Your password has been updated 🎉.`
  String get resetPasswordSuccess {
    return Intl.message(
      'Your password has been updated 🎉.',
      name: 'resetPasswordSuccess',
      desc: 'Message displayed after successfully resetting the password',
      args: [],
    );
  }

  /// `Change Password`
  String get changePasswordButton {
    return Intl.message(
      'Change Password',
      name: 'changePasswordButton',
      desc:
          'Text for the button to change the password on the reset password screen',
      args: [],
    );
  }

  /// `Yesterday`
  String get yesterday {
    return Intl.message(
      'Yesterday',
      name: 'yesterday',
      desc: 'Text displayed to represent messages sent the previous day',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: 'Text displayed to represent messages sent on the same day',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: 'Title for the settings screen',
      args: [],
    );
  }

  /// `General Settings`
  String get generalSettings {
    return Intl.message(
      'General Settings',
      name: 'generalSettings',
      desc: 'Title for the general settings section',
      args: [],
    );
  }

  /// `Other`
  String get other {
    return Intl.message(
      'Other',
      name: 'other',
      desc: 'Title for the other settings section',
      args: [],
    );
  }

  /// `Personal Info`
  String get personalInfo {
    return Intl.message(
      'Personal Info',
      name: 'personalInfo',
      desc: 'Title for the personal information settings screen',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: 'Title for the profile settings screen',
      args: [],
    );
  }

  /// `Save Changes`
  String get saveChanges {
    return Intl.message(
      'Save Changes',
      name: 'saveChanges',
      desc:
          'Text for the button to save changes on the profile settings screen',
      args: [],
    );
  }

  /// `Friends`
  String get friends {
    return Intl.message(
      'Friends',
      name: 'friends',
      desc: 'Title for the friends settings screen',
      args: [],
    );
  }

  /// `Search for friends`
  String get searchFriends {
    return Intl.message(
      'Search for friends',
      name: 'searchFriends',
      desc: 'Hint text for the search field on the friends settings screen',
      args: [],
    );
  }

  /// `All Friends`
  String get allFriends {
    return Intl.message(
      'All Friends',
      name: 'allFriends',
      desc:
          'Title for the section displaying all friends on the friends settings screen',
      args: [],
    );
  }

  /// `Explore`
  String get explore {
    return Intl.message(
      'Explore',
      name: 'explore',
      desc: 'Title for the explore users screen',
      args: [],
    );
  }

  /// `Explore Users`
  String get exploreTitle {
    return Intl.message(
      'Explore Users',
      name: 'exploreTitle',
      desc: 'Title for the explore users screen',
      args: [],
    );
  }

  /// `Search for users`
  String get exploreSearchHint {
    return Intl.message(
      'Search for users',
      name: 'exploreSearchHint',
      desc: 'Hint text for the search field on the explore users screen',
      args: [],
    );
  }

  /// `Mutual Friends`
  String get mutualFriends {
    return Intl.message(
      'Mutual Friends',
      name: 'mutualFriends',
      desc:
          'Label for the number of mutual friends displayed on user cards in the explore users screen',
      args: [],
    );
  }

  /// `No users found`
  String get exploreEmpty {
    return Intl.message(
      'No users found',
      name: 'exploreEmpty',
      desc:
          'Text displayed when there are no users on the explore users screen',
      args: [],
    );
  }

  /// `No users found`
  String get exploreEmptySearch {
    return Intl.message(
      'No users found',
      name: 'exploreEmptySearch',
      desc:
          'Text displayed when no users are found during search on the explore users screen',
      args: [],
    );
  }

  /// `Requests`
  String get requests {
    return Intl.message(
      'Requests',
      name: 'requests',
      desc: 'Title for the friend requests screen',
      args: [],
    );
  }

  /// `Explore Requests`
  String get requestsTitle {
    return Intl.message(
      'Explore Requests',
      name: 'requestsTitle',
      desc: 'Title for the explore requests screen',
      args: [],
    );
  }

  /// `Search for friend requests`
  String get requestsSearchHint {
    return Intl.message(
      'Search for friend requests',
      name: 'requestsSearchHint',
      desc: 'Hint text for the search field on the explore requests screen',
      args: [],
    );
  }

  /// `No friend requests`
  String get requestsEmpty {
    return Intl.message(
      'No friend requests',
      name: 'requestsEmpty',
      desc:
          'Text displayed when there are no friend requests on the explore requests screen',
      args: [],
    );
  }

  /// `No friend requests found`
  String get requestsEmptySearch {
    return Intl.message(
      'No friend requests found',
      name: 'requestsEmptySearch',
      desc:
          'Text displayed when no friend requests are found during search on the explore requests screen',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc:
          'Text for the accept button on friend requests in the explore requests screen',
      args: [],
    );
  }

  /// `Decline`
  String get decline {
    return Intl.message(
      'Decline',
      name: 'decline',
      desc:
          'Text for the decline button on friend requests in the explore requests screen',
      args: [],
    );
  }

  /// `Accepted successfully`
  String get friendRequestAccepted {
    return Intl.message(
      'Accepted successfully',
      name: 'friendRequestAccepted',
      desc: 'Message displayed when a friend request is accepted',
      args: [],
    );
  }

  /// `Declined successfully`
  String get friendRequestDeclined {
    return Intl.message(
      'Declined successfully',
      name: 'friendRequestDeclined',
      desc: 'Message displayed when a friend request is declined',
      args: [],
    );
  }

  /// `App Settings`
  String get appSettings {
    return Intl.message(
      'App Settings',
      name: 'appSettings',
      desc: 'Title for the app settings screen',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: 'Title for the theme settings screen',
      args: [],
    );
  }

  /// `Select your preferred theme :`
  String get selectTheme {
    return Intl.message(
      'Select your preferred theme :',
      name: 'selectTheme',
      desc: 'Subtitle for the theme settings screen',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: 'Option for selecting light theme',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: 'Option for selecting dark theme',
      args: [],
    );
  }

  /// `System`
  String get system {
    return Intl.message(
      'System',
      name: 'system',
      desc: 'Option for selecting system default theme',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: 'Title for the language settings screen',
      args: [],
    );
  }

  /// `Select your preferred language :`
  String get selectLanguage {
    return Intl.message(
      'Select your preferred language :',
      name: 'selectLanguage',
      desc: 'Subtitle for the language settings screen',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: 'Option for selecting English language',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: 'Option for selecting Arabic language',
      args: [],
    );
  }

  /// `French`
  String get french {
    return Intl.message(
      'French',
      name: 'french',
      desc: 'Option for selecting French language',
      args: [],
    );
  }

  /// `German`
  String get german {
    return Intl.message(
      'German',
      name: 'german',
      desc: 'Option for selecting German language',
      args: [],
    );
  }

  /// `Italian`
  String get italian {
    return Intl.message(
      'Italian',
      name: 'italian',
      desc: 'Option for selecting Italian language',
      args: [],
    );
  }

  /// `Other Settings`
  String get otherSettings {
    return Intl.message(
      'Other Settings',
      name: 'otherSettings',
      desc: 'Title for the other settings screen',
      args: [],
    );
  }

  /// `Invite Friends`
  String get inviteFriends {
    return Intl.message(
      'Invite Friends',
      name: 'inviteFriends',
      desc: 'Text for the invite friends option in the settings',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: 'Text for the logout option in the settings',
      args: [],
    );
  }

  /// `Are you sure you want to logout?`
  String get logoutDialogTitle {
    return Intl.message(
      'Are you sure you want to logout?',
      name: 'logoutDialogTitle',
      desc: 'Title for the logout confirmation dialog',
      args: [],
    );
  }

  /// `You will need to login again to access your account.`
  String get logoutDialogContent {
    return Intl.message(
      'You will need to login again to access your account.',
      name: 'logoutDialogContent',
      desc: 'Content for the logout confirmation dialog',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: 'Text for the delete account option in the settings',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account?`
  String get deleteAccountDialogTitle {
    return Intl.message(
      'Are you sure you want to delete your account?',
      name: 'deleteAccountDialogTitle',
      desc: 'Title for the delete account confirmation dialog',
      args: [],
    );
  }

  /// `This action cannot be undone. All your data will be permanently deleted.`
  String get deleteAccountDialogContent {
    return Intl.message(
      'This action cannot be undone. All your data will be permanently deleted.',
      name: 'deleteAccountDialogContent',
      desc: 'Content for the delete account confirmation dialog',
      args: [],
    );
  }

  /// `Yes, Delete`
  String get deleteDialogConfirm {
    return Intl.message(
      'Yes, Delete',
      name: 'deleteDialogConfirm',
      desc:
          'Text for the confirm button in the delete account confirmation dialog',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: 'Text for the cancel button in confirmation dialogs',
      args: [],
    );
  }

  /// `Help & Support`
  String get helpAndSupport {
    return Intl.message(
      'Help & Support',
      name: 'helpAndSupport',
      desc: 'Title for the help and support screen',
      args: [],
    );
  }

  /// `Tap to call support team`
  String get supportCallTitle {
    return Intl.message(
      'Tap to call support team',
      name: 'supportCallTitle',
      desc: 'Title for the support call section in the help and support screen',
      args: [],
    );
  }

  /// `Tap to call support team`
  String get supportCallSubTitle {
    return Intl.message(
      'Tap to call support team',
      name: 'supportCallSubTitle',
      desc:
          'Subtitle for the support call section in the help and support screen',
      args: [],
    );
  }

  /// `WhatsApp`
  String get supportWhatsappTitle {
    return Intl.message(
      'WhatsApp',
      name: 'supportWhatsappTitle',
      desc:
          'Title for the WhatsApp support section in the help and support screen',
      args: [],
    );
  }

  /// `Tap to chat with support team on WhatsApp`
  String get supportWhatsappSubTitle {
    return Intl.message(
      'Tap to chat with support team on WhatsApp',
      name: 'supportWhatsappSubTitle',
      desc:
          'Subtitle for the WhatsApp support section in the help and support screen',
      args: [],
    );
  }

  /// `Website`
  String get supportWebsiteTitle {
    return Intl.message(
      'Website',
      name: 'supportWebsiteTitle',
      desc:
          'Title for the website support section in the help and support screen',
      args: [],
    );
  }

  /// `Tap to visit our website`
  String get supportWebsiteSubTitle {
    return Intl.message(
      'Tap to visit our website',
      name: 'supportWebsiteSubTitle',
      desc:
          'Subtitle for the website support section in the help and support screen',
      args: [],
    );
  }

  /// `--- Frequently Asked Questions ---`
  String get faqQuestions {
    return Intl.message(
      '--- Frequently Asked Questions ---',
      name: 'faqQuestions',
      desc:
          'Title for the frequently asked questions section in the help and support screen',
      args: [],
    );
  }

  /// `Is IBond free?`
  String get faqQuestion1 {
    return Intl.message(
      'Is IBond free?',
      name: 'faqQuestion1',
      desc: 'First frequently asked question in the help and support screen',
      args: [],
    );
  }

  /// `Yes! IBond is completely free to download and use. However, you will need an internet connection (Wi-Fi or mobile data).`
  String get faqAnswer1 {
    return Intl.message(
      'Yes! IBond is completely free to download and use. However, you will need an internet connection (Wi-Fi or mobile data).',
      name: 'faqAnswer1',
      desc:
          'Answer to the first frequently asked question in the help and support screen',
      args: [],
    );
  }

  /// `Does it work on Wi-Fi and mobile data?`
  String get faqQuestion2 {
    return Intl.message(
      'Does it work on Wi-Fi and mobile data?',
      name: 'faqQuestion2',
      desc: 'Second frequently asked question in the help and support screen',
      args: [],
    );
  }

  /// `Yes, IBond works efficiently on Wi-Fi and mobile data. It automatically selects the best quality based on your connection speed.`
  String get faqAnswer2 {
    return Intl.message(
      'Yes, IBond works efficiently on Wi-Fi and mobile data. It automatically selects the best quality based on your connection speed.',
      name: 'faqAnswer2',
      desc:
          'Answer to the second frequently asked question in the help and support screen',
      args: [],
    );
  }

  /// `Does it support voice and video calls?`
  String get faqQuestion3 {
    return Intl.message(
      'Does it support voice and video calls?',
      name: 'faqQuestion3',
      desc: 'Third frequently asked question in the help and support screen',
      args: [],
    );
  }

  /// `Of course! You can make high-quality voice and video calls with anyone who uses IBond.`
  String get faqAnswer3 {
    return Intl.message(
      'Of course! You can make high-quality voice and video calls with anyone who uses IBond.',
      name: 'faqAnswer3',
      desc:
          'Answer to the third frequently asked question in the help and support screen',
      args: [],
    );
  }

  /// `How do I add my friends?`
  String get faqQuestion4 {
    return Intl.message(
      'How do I add my friends?',
      name: 'faqQuestion4',
      desc: 'Fourth frequently asked question in the help and support screen',
      args: [],
    );
  }

  /// `After registration, IBond displays contacts who have the app installed. You can also invite your friends to download the app.`
  String get faqAnswer4 {
    return Intl.message(
      'After registration, IBond displays contacts who have the app installed. You can also invite your friends to download the app.',
      name: 'faqAnswer4',
      desc:
          'Answer to the fourth frequently asked question in the help and support screen',
      args: [],
    );
  }

  /// `What data do you collect?`
  String get faqQuestion5 {
    return Intl.message(
      'What data do you collect?',
      name: 'faqQuestion5',
      desc: 'Fifth frequently asked question in the help and support screen',
      args: [],
    );
  }

  /// `We collect only the minimum amount of data required to run the service. You can read our privacy policy for full details.`
  String get faqAnswer5 {
    return Intl.message(
      'We collect only the minimum amount of data required to run the service. You can read our privacy policy for full details.',
      name: 'faqAnswer5',
      desc:
          'Answer to the fifth frequently asked question in the help and support screen',
      args: [],
    );
  }

  /// `How do I delete my account or request deletion of my data?`
  String get faqQuestion6 {
    return Intl.message(
      'How do I delete my account or request deletion of my data?',
      name: 'faqQuestion6',
      desc: 'Sixth frequently asked question in the help and support screen',
      args: [],
    );
  }

  /// `You can delete your account from the app settings. If you want to request deletion of your data, please contact us via email.`
  String get faqAnswer6 {
    return Intl.message(
      'You can delete your account from the app settings. If you want to request deletion of your data, please contact us via email.',
      name: 'faqAnswer6',
      desc:
          'Answer to the sixth frequently asked question in the help and support screen',
      args: [],
    );
  }

  /// `Terms & Policies`
  String get termsAndPolicies {
    return Intl.message(
      'Terms & Policies',
      name: 'termsAndPolicies',
      desc: 'Title for the terms and policies screen',
      args: [],
    );
  }

  /// `Privacy and Security`
  String get policyTitle {
    return Intl.message(
      'Privacy and Security',
      name: 'policyTitle',
      desc: 'Title for the privacy and security policy screen',
      args: [],
    );
  }

  /// `Welcome to our Chat App. Your privacy is very important to us. This Privacy Policy explains how we collect, use, protect, and share your information when you use our application.`
  String get ploicyContent {
    return Intl.message(
      'Welcome to our Chat App. Your privacy is very important to us. This Privacy Policy explains how we collect, use, protect, and share your information when you use our application.',
      name: 'ploicyContent',
      desc: 'Content for the privacy and security policy screen',
      args: [],
    );
  }

  /// `Information We Collect`
  String get informationWeCollect {
    return Intl.message(
      'Information We Collect',
      name: 'informationWeCollect',
      desc:
          'Title for the section about information collection in the privacy policy',
      args: [],
    );
  }

  /// `a. Information You Provide:`
  String get informationWeCollectSubTitle1 {
    return Intl.message(
      'a. Information You Provide:',
      name: 'informationWeCollectSubTitle1',
      desc:
          'Subtitle for the section about user-provided information in the privacy policy',
      args: [],
    );
  }

  /// `• Name, username, and profile photo.\n• Phone number or email address.\n• Messages, voice notes, images, and files you send.\n• Contacts (only if you allow access).`
  String get informationWeCollectContent1 {
    return Intl.message(
      '• Name, username, and profile photo.\n• Phone number or email address.\n• Messages, voice notes, images, and files you send.\n• Contacts (only if you allow access).',
      name: 'informationWeCollectContent1',
      desc:
          'Content for the section about user-provided information in the privacy policy',
      args: [],
    );
  }

  /// `b. Automatically Collected Information:`
  String get informationWeCollectSubTitle2 {
    return Intl.message(
      'b. Automatically Collected Information:',
      name: 'informationWeCollectSubTitle2',
      desc:
          'Subtitle for the section about automatically collected information in the privacy policy',
      args: [],
    );
  }

  /// `• Device type, operating system, and app version.\n• IP address and approximate location.\n• Usage data such as features you use and time spent.`
  String get informationWeCollectContent2 {
    return Intl.message(
      '• Device type, operating system, and app version.\n• IP address and approximate location.\n• Usage data such as features you use and time spent.',
      name: 'informationWeCollectContent2',
      desc:
          'Content for the section about automatically collected information in the privacy policy',
      args: [],
    );
  }

  /// `3. How We Use Your Information`
  String get howWeUseYourInformation {
    return Intl.message(
      '3. How We Use Your Information',
      name: 'howWeUseYourInformation',
      desc:
          'Title for the section about how user information is used in the privacy policy',
      args: [],
    );
  }

  /// `We use your information to:`
  String get howWeUseYourInformationSubTitle {
    return Intl.message(
      'We use your information to:',
      name: 'howWeUseYourInformationSubTitle',
      desc:
          'Subtitle for the section about how user information is used in the privacy policy',
      args: [],
    );
  }

  /// `• Provide and improve chat, call, and media features\n• Create and manage your account\n• Deliver messages and calls securely\n• Improve performance and fix bugs\n• Send important notifications (like security alerts)`
  String get howWeUseYourInformationContent {
    return Intl.message(
      '• Provide and improve chat, call, and media features\n• Create and manage your account\n• Deliver messages and calls securely\n• Improve performance and fix bugs\n• Send important notifications (like security alerts)',
      name: 'howWeUseYourInformationContent',
      desc:
          'Content for the section about how user information is used in the privacy policy',
      args: [],
    );
  }

  /// `4. Messages & Encryption`
  String get messagesAndEncryption {
    return Intl.message(
      '4. Messages & Encryption',
      name: 'messagesAndEncryption',
      desc:
          'Title for the section about messages and encryption in the privacy policy',
      args: [],
    );
  }

  /// `Your messages are protected using end-to-end encryption.\nThis means only you and the person you are chatting with can read the messages. We cannot read or listen to your private messages.`
  String get messagesAndEncryptionContent {
    return Intl.message(
      'Your messages are protected using end-to-end encryption.\nThis means only you and the person you are chatting with can read the messages. We cannot read or listen to your private messages.',
      name: 'messagesAndEncryptionContent',
      desc:
          'Content for the section about messages and encryption in the privacy policy',
      args: [],
    );
  }

  /// `5. Sharing Your Information`
  String get sharingYourInformation {
    return Intl.message(
      '5. Sharing Your Information',
      name: 'sharingYourInformation',
      desc:
          'Title for the section about sharing user information in the privacy policy',
      args: [],
    );
  }

  /// `We only share information:`
  String get sharingYourInformationSubTitle {
    return Intl.message(
      'We only share information:',
      name: 'sharingYourInformationSubTitle',
      desc:
          'Subtitle for the section about sharing user information in the privacy policy',
      args: [],
    );
  }

  /// `• When required by law\n• To protect users and prevent fraud\n• With trusted partners who help us run the service (under strict privacy rules)\n`
  String get sharingYourInformationContent {
    return Intl.message(
      '• When required by law\n• To protect users and prevent fraud\n• With trusted partners who help us run the service (under strict privacy rules)\n',
      name: 'sharingYourInformationContent',
      desc:
          'Content for the section about sharing user information in the privacy policy',
      args: [],
    );
  }

  /// `6. Data Storage & Security`
  String get dataStorageAndSecurity {
    return Intl.message(
      '6. Data Storage & Security',
      name: 'dataStorageAndSecurity',
      desc:
          'Title for the section about data storage and security in the privacy policy',
      args: [],
    );
  }

  /// `We use strong security measures to protect your data, including:`
  String get dataStorageAndSecuritySubTitle1 {
    return Intl.message(
      'We use strong security measures to protect your data, including:',
      name: 'dataStorageAndSecuritySubTitle1',
      desc:
          'Subtitle for the section about data storage and security in the privacy policy',
      args: [],
    );
  }

  /// `• Encryption\n• Secure servers\n•Limited access to user data`
  String get dataStorageAndSecurityContent {
    return Intl.message(
      '• Encryption\n• Secure servers\n•Limited access to user data',
      name: 'dataStorageAndSecurityContent',
      desc:
          'Content for the section about data storage and security in the privacy policy',
      args: [],
    );
  }

  /// `Despite our efforts, no system is 100% secure, but we continuously work to protect your information.`
  String get dataStorageAndSecuritySubTitle2 {
    return Intl.message(
      'Despite our efforts, no system is 100% secure, but we continuously work to protect your information.',
      name: 'dataStorageAndSecuritySubTitle2',
      desc:
          'Subtitle for the section about data storage and security in the privacy policy',
      args: [],
    );
  }

  /// `7. Your Rights`
  String get yourRights {
    return Intl.message(
      '7. Your Rights',
      name: 'yourRights',
      desc: 'Title for the section about user rights in the privacy policy',
      args: [],
    );
  }

  /// `You have the right to:`
  String get yourRightsSubTitle {
    return Intl.message(
      'You have the right to:',
      name: 'yourRightsSubTitle',
      desc: 'Subtitle for the section about user rights in the privacy policy',
      args: [],
    );
  }

  /// `• Access your personal data\n• Edit or update your profile\n• Delete your account and data\n• Control privacy settings (last seen, profile photo, status)`
  String get yourRightsContent {
    return Intl.message(
      '• Access your personal data\n• Edit or update your profile\n• Delete your account and data\n• Control privacy settings (last seen, profile photo, status)',
      name: 'yourRightsContent',
      desc: 'Content for the section about user rights in the privacy policy',
      args: [],
    );
  }

  /// `8. Changes to This Policy`
  String get changesToThisPolicy {
    return Intl.message(
      '8. Changes to This Policy',
      name: 'changesToThisPolicy',
      desc: 'Title for the section about changes to the privacy policy',
      args: [],
    );
  }

  /// `We may update this policy from time to time.\nWhen we do, we will update the “Last Updated” date and notify you if the changes are important.`
  String get changesToThisPolicyContent {
    return Intl.message(
      'We may update this policy from time to time.\nWhen we do, we will update the “Last Updated” date and notify you if the changes are important.',
      name: 'changesToThisPolicyContent',
      desc: 'Content for the section about changes to the privacy policy',
      args: [],
    );
  }

  /// `9. Contact Us`
  String get contactUs {
    return Intl.message(
      '9. Contact Us',
      name: 'contactUs',
      desc:
          'Title for the section about contacting support in the privacy policy',
      args: [],
    );
  }

  /// `If you have any questions about this Privacy Policy, you can contact us at:`
  String get contactUsContent {
    return Intl.message(
      'If you have any questions about this Privacy Policy, you can contact us at:',
      name: 'contactUsContent',
      desc:
          'Content for the section about contacting support in the privacy policy',
      args: [],
    );
  }

  /// `Last Updated: January 2026`
  String get contactLastUpdated {
    return Intl.message(
      'Last Updated: January 2026',
      name: 'contactLastUpdated',
      desc: 'Text indicating the last updated date of the privacy policy',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
