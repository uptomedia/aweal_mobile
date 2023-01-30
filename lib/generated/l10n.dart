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

  /// `There is no Internet connection`
  String get thereIsNoInternetConnection {
    return Intl.message(
      'There is no Internet connection',
      name: 'thereIsNoInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Please check your Internet connection`
  String get pleaseCheckYourInternetConnection {
    return Intl.message(
      'Please check your Internet connection',
      name: 'pleaseCheckYourInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Play offline courses`
  String get playOfflineCourses {
    return Intl.message(
      'Play offline courses',
      name: 'playOfflineCourses',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Downloaded Course`
  String get downloadedCourse {
    return Intl.message(
      'Downloaded Course',
      name: 'downloadedCourse',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Auth failed`
  String get authFailed {
    return Intl.message(
      'Auth failed',
      name: 'authFailed',
      desc: '',
      args: [],
    );
  }

  /// `Could not authenticate!`
  String get couldNotAuthenticate {
    return Intl.message(
      'Could not authenticate!',
      name: 'couldNotAuthenticate',
      desc: '',
      args: [],
    );
  }

  /// `Login Successful`
  String get loginSuccessful {
    return Intl.message(
      'Login Successful',
      name: 'loginSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get logIn {
    return Intl.message(
      'Log in',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Password should be more than 3 characters`
  String get passwordShouldBeMoreThanCharacters {
    return Intl.message(
      'Password should be more than 3 characters',
      name: 'passwordShouldBeMoreThanCharacters',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Do not have an account?`
  String get doNotHaveAnAccount {
    return Intl.message(
      'Do not have an account?',
      name: 'doNotHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Already purchased. Check My Course.`
  String get alreadyPurchasedCheckMyCourse {
    return Intl.message(
      'Already purchased. Check My Course.',
      name: 'alreadyPurchasedCheckMyCourse',
      desc: '',
      args: [],
    );
  }

  /// `Please login first`
  String get pleaseLoginFirst {
    return Intl.message(
      'Please login first',
      name: 'pleaseLoginFirst',
      desc: '',
      args: [],
    );
  }

  /// `Renew`
  String get renew {
    return Intl.message(
      'Renew',
      name: 'renew',
      desc: '',
      args: [],
    );
  }

  /// `Purchased`
  String get purchased {
    return Intl.message(
      'Purchased',
      name: 'purchased',
      desc: '',
      args: [],
    );
  }

  /// `Buy Now`
  String get buyNow {
    return Intl.message(
      'Buy Now',
      name: 'buyNow',
      desc: '',
      args: [],
    );
  }

  /// `Included Courses`
  String get includedCourses {
    return Intl.message(
      'Included Courses',
      name: 'includedCourses',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Showing`
  String get showing {
    return Intl.message(
      'Showing',
      name: 'showing',
      desc: '',
      args: [],
    );
  }

  /// `Bundles`
  String get bundles {
    return Intl.message(
      'Bundles',
      name: 'bundles',
      desc: '',
      args: [],
    );
  }

  /// `Wishlist`
  String get wishlist {
    return Intl.message(
      'Wishlist',
      name: 'wishlist',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Enrolled Successfully`
  String get enrolledSuccessfully {
    return Intl.message(
      'Enrolled Successfully',
      name: 'enrolledSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Get Enroll`
  String get getEnroll {
    return Intl.message(
      'Get Enroll',
      name: 'getEnroll',
      desc: '',
      args: [],
    );
  }

  /// `Includes`
  String get includes {
    return Intl.message(
      'Includes',
      name: 'includes',
      desc: '',
      args: [],
    );
  }

  /// `Outcomes`
  String get outcomes {
    return Intl.message(
      'Outcomes',
      name: 'outcomes',
      desc: '',
      args: [],
    );
  }

  /// `Requirements`
  String get requirements {
    return Intl.message(
      'Requirements',
      name: 'requirements',
      desc: '',
      args: [],
    );
  }

  /// `What is Included`
  String get whatIsIncluded {
    return Intl.message(
      'What is Included',
      name: 'whatIsIncluded',
      desc: '',
      args: [],
    );
  }

  /// `What you will learn`
  String get whatYouWillLearn {
    return Intl.message(
      'What you will learn',
      name: 'whatYouWillLearn',
      desc: '',
      args: [],
    );
  }

  /// `Course Requirements`
  String get courseRequirements {
    return Intl.message(
      'Course Requirements',
      name: 'courseRequirements',
      desc: '',
      args: [],
    );
  }

  /// `Course Curriculum`
  String get courseCurriculum {
    return Intl.message(
      'Course Curriculum',
      name: 'courseCurriculum',
      desc: '',
      args: [],
    );
  }

  /// `Courses`
  String get courses {
    return Intl.message(
      'Courses',
      name: 'courses',
      desc: '',
      args: [],
    );
  }

  /// `No lessons downloaded yet`
  String get noLessonsDownloadedYet {
    return Intl.message(
      'No lessons downloaded yet',
      name: 'noLessonsDownloadedYet',
      desc: '',
      args: [],
    );
  }

  /// `Notifying`
  String get notifying {
    return Intl.message(
      'Notifying',
      name: 'notifying',
      desc: '',
      args: [],
    );
  }

  /// `Do you wish to remove this lesson?`
  String get doYouWishToRemoveThisLesson {
    return Intl.message(
      'Do you wish to remove this lesson?',
      name: 'doYouWishToRemoveThisLesson',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Removed from download list.`
  String get removedFromDownloadList {
    return Intl.message(
      'Removed from download list.',
      name: 'removedFromDownloadList',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Total Lessons: `
  String get totalLessons {
    return Intl.message(
      'Total Lessons: ',
      name: 'totalLessons',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Password Update failed`
  String get passwordUpdateFailed {
    return Intl.message(
      'Password Update failed',
      name: 'passwordUpdateFailed',
      desc: '',
      args: [],
    );
  }

  /// `Update Password`
  String get updatePassword {
    return Intl.message(
      'Update Password',
      name: 'updatePassword',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get currentPassword {
    return Intl.message(
      'Current Password',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `Can not be empty`
  String get canNotBeEmpty {
    return Intl.message(
      'Can not be empty',
      name: 'canNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password is too short!`
  String get passwordIsTooShort {
    return Intl.message(
      'Password is too short!',
      name: 'passwordIsTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match!`
  String get passwordsDoNotmatch {
    return Intl.message(
      'Passwords do not match!',
      name: 'passwordsDoNotmatch',
      desc: '',
      args: [],
    );
  }

  /// `Update Now`
  String get updateNow {
    return Intl.message(
      'Update Now',
      name: 'updateNow',
      desc: '',
      args: [],
    );
  }

  /// `Update Failed !`
  String get updateFailed {
    return Intl.message(
      'Update Failed !',
      name: 'updateFailed',
      desc: '',
      args: [],
    );
  }

  /// `Error Occured`
  String get errorOccured {
    return Intl.message(
      'Error Occured',
      name: 'errorOccured',
      desc: '',
      args: [],
    );
  }

  /// `Update Profile Picture`
  String get updateProfilePicture {
    return Intl.message(
      'Update Profile Picture',
      name: 'updateProfilePicture',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `First name cannot be empty`
  String get firstNameCannotBeEmpty {
    return Intl.message(
      'First name cannot be empty',
      name: 'firstNameCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Last name cannot be empty`
  String get lastNameCannotBeEmpty {
    return Intl.message(
      'Last name cannot be empty',
      name: 'lastNameCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Email Id should be valid`
  String get emailIdShouldBeValid {
    return Intl.message(
      'Email Id should be valid',
      name: 'emailIdShouldBeValid',
      desc: '',
      args: [],
    );
  }

  /// `Biography`
  String get biography {
    return Intl.message(
      'Biography',
      name: 'biography',
      desc: '',
      args: [],
    );
  }

  /// `facebook Link`
  String get facebookLink {
    return Intl.message(
      'facebook Link',
      name: 'facebookLink',
      desc: '',
      args: [],
    );
  }

  /// `Twitter Link`
  String get twitterLink {
    return Intl.message(
      'Twitter Link',
      name: 'twitterLink',
      desc: '',
      args: [],
    );
  }

  /// `LinkedIn Link`
  String get linkedInLink {
    return Intl.message(
      'LinkedIn Link',
      name: 'linkedInLink',
      desc: '',
      args: [],
    );
  }

  /// `Note:`
  String get note {
    return Intl.message(
      'Note:',
      name: 'note',
      desc: '',
      args: [],
    );
  }

  /// `Provide your email address to reset password.`
  String get provideYourEmailAddressToResetPassword {
    return Intl.message(
      'Provide your email address to reset password.',
      name: 'provideYourEmailAddressToResetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Want to go Back?`
  String get wantToGoBack {
    return Intl.message(
      'Want to go Back?',
      name: 'wantToGoBack',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Could not post reply`
  String get couldNotPostReply {
    return Intl.message(
      'Could not post reply',
      name: 'couldNotPostReply',
      desc: '',
      args: [],
    );
  }

  /// `Reply Posted`
  String get replyPosted {
    return Intl.message(
      'Reply Posted',
      name: 'replyPosted',
      desc: '',
      args: [],
    );
  }

  /// `Reply has been deleted`
  String get replyHasBeenDeleted {
    return Intl.message(
      'Reply has been deleted',
      name: 'replyHasBeenDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get remove {
    return Intl.message(
      'Remove',
      name: 'remove',
      desc: '',
      args: [],
    );
  }

  /// `Reply`
  String get reply {
    return Intl.message(
      'Reply',
      name: 'reply',
      desc: '',
      args: [],
    );
  }

  /// `Top Course`
  String get topCourse {
    return Intl.message(
      'Top Course',
      name: 'topCourse',
      desc: '',
      args: [],
    );
  }

  /// `All courses`
  String get allCourses {
    return Intl.message(
      'All courses',
      name: 'allCourses',
      desc: '',
      args: [],
    );
  }

  /// `All bundles`
  String get allBundles {
    return Intl.message(
      'All bundles',
      name: 'allBundles',
      desc: '',
      args: [],
    );
  }

  /// `Course Categories`
  String get courseCategories {
    return Intl.message(
      'Course Categories',
      name: 'courseCategories',
      desc: '',
      args: [],
    );
  }

  /// `Course Details`
  String get courseDetails {
    return Intl.message(
      'Course Details',
      name: 'courseDetails',
      desc: '',
      args: [],
    );
  }

  /// `Share this Course`
  String get shareThisCourse {
    return Intl.message(
      'Share this Course',
      name: 'shareThisCourse',
      desc: '',
      args: [],
    );
  }

  /// `Course Progress Updated`
  String get courseProgressUpdated {
    return Intl.message(
      'Course Progress Updated',
      name: 'courseProgressUpdated',
      desc: '',
      args: [],
    );
  }

  /// `This video format is not supported for download.`
  String get thsisVideoFormatIsNotSupportedForDownload {
    return Intl.message(
      'This video format is not supported for download.',
      name: 'thsisVideoFormatIsNotSupportedForDownload',
      desc: '',
      args: [],
    );
  }

  /// `This video format is not supported for download.`
  String get thisVideoFormatIsNotSupportedForDownload {
    return Intl.message(
      'This video format is not supported for download.',
      name: 'thisVideoFormatIsNotSupportedForDownload',
      desc: '',
      args: [],
    );
  }

  /// `Quiz`
  String get quiz {
    return Intl.message(
      'Quiz',
      name: 'quiz',
      desc: '',
      args: [],
    );
  }

  /// `Attachment`
  String get attachment {
    return Intl.message(
      'Attachment',
      name: 'attachment',
      desc: '',
      args: [],
    );
  }

  /// `Lessons`
  String get lessons {
    return Intl.message(
      'Lessons',
      name: 'lessons',
      desc: '',
      args: [],
    );
  }

  /// `LiveClass`
  String get liveClass {
    return Intl.message(
      'LiveClass',
      name: 'liveClass',
      desc: '',
      args: [],
    );
  }

  /// `Forum`
  String get forum {
    return Intl.message(
      'Forum',
      name: 'forum',
      desc: '',
      args: [],
    );
  }

  /// `Video was downloaded already`
  String get videoWasDownloadedAlready {
    return Intl.message(
      'Video was downloaded already',
      name: 'videoWasDownloadedAlready',
      desc: '',
      args: [],
    );
  }

  /// `Your subscription has been expired. To continue please renew the subscription.`
  String
      get yourSubscriptionHasBeenExpiredToContinuePleaseRenewTheSubscription {
    return Intl.message(
      'Your subscription has been expired. To continue please renew the subscription.',
      name:
          'yourSubscriptionHasBeenExpiredToContinuePleaseRenewTheSubscription',
      desc: '',
      args: [],
    );
  }

  /// `Renew Now`
  String get renewNow {
    return Intl.message(
      'Renew Now',
      name: 'renewNow',
      desc: '',
      args: [],
    );
  }

  /// `previous lessons was not completed`
  String get previousLessonsWasNotCompleted {
    return Intl.message(
      'previous lessons was not completed',
      name: 'previousLessonsWasNotCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Watch lessons to update course progress`
  String get watchLessonsToUpdateCourseProgress {
    return Intl.message(
      'Watch lessons to update course progress',
      name: 'watchLessonsToUpdateCourseProgress',
      desc: '',
      args: [],
    );
  }

  /// `My Courses`
  String get myCourses {
    return Intl.message(
      'My Courses',
      name: 'myCourses',
      desc: '',
      args: [],
    );
  }

  /// `My Bundles`
  String get myBundles {
    return Intl.message(
      'My Bundles',
      name: 'myBundles',
      desc: '',
      args: [],
    );
  }

  /// `My Wish list`
  String get myWishlist {
    return Intl.message(
      'My Wish list',
      name: 'myWishlist',
      desc: '',
      args: [],
    );
  }

  /// `Search questions...`
  String get searchQuestions {
    return Intl.message(
      'Search questions...',
      name: 'searchQuestions',
      desc: '',
      args: [],
    );
  }

  /// `Found`
  String get found {
    return Intl.message(
      'Found',
      name: 'found',
      desc: '',
      args: [],
    );
  }

  /// `Questions`
  String get questions {
    return Intl.message(
      'Questions',
      name: 'questions',
      desc: '',
      args: [],
    );
  }

  /// `Ask a new question`
  String get askaNewQuestion {
    return Intl.message(
      'Ask a new question',
      name: 'askaNewQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Sign up Successful`
  String get signUpSuccessful {
    return Intl.message(
      'Sign up Successful',
      name: 'signUpSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Could not register!`
  String get couldNotRegister {
    return Intl.message(
      'Could not register!',
      name: 'couldNotRegister',
      desc: '',
      args: [],
    );
  }

  /// `Already have an Account`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an Account',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sub-Categories`
  String get subCategories {
    return Intl.message(
      'Sub-Categories',
      name: 'subCategories',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `My Course`
  String get myCourse {
    return Intl.message(
      'My Course',
      name: 'myCourse',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `could not verify email!`
  String get couldNotVerifyEmail {
    return Intl.message(
      'could not verify email!',
      name: 'couldNotVerifyEmail',
      desc: '',
      args: [],
    );
  }

  /// `could not send code!`
  String get couldNotSendCode {
    return Intl.message(
      'could not send code!',
      name: 'couldNotSendCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter code from your email`
  String get enterCodeFromYourEmail {
    return Intl.message(
      'Enter code from your email',
      name: 'enterCodeFromYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Verification Code`
  String get verificationCode {
    return Intl.message(
      'Verification Code',
      name: 'verificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter 6 digit verification code send to your email.`
  String get enterDigitVerificationCodeSendToYourEmail {
    return Intl.message(
      'Enter 6 digit verification code send to your email.',
      name: 'enterDigitVerificationCodeSendToYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `No back history item`
  String get noBackHistoryItem {
    return Intl.message(
      'No back history item',
      name: 'noBackHistoryItem',
      desc: '',
      args: [],
    );
  }

  /// `No forward history item`
  String get noForwardHistoryItem {
    return Intl.message(
      'No forward history item',
      name: 'noForwardHistoryItem',
      desc: '',
      args: [],
    );
  }

  /// `Search Here`
  String get searchHere {
    return Intl.message(
      'Search Here',
      name: 'searchHere',
      desc: '',
      args: [],
    );
  }

  /// `Ask your question`
  String get askYourQuestion {
    return Intl.message(
      'Ask your question',
      name: 'askYourQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Title of summary`
  String get titleOfSummary {
    return Intl.message(
      'Title of summary',
      name: 'titleOfSummary',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Publish`
  String get publish {
    return Intl.message(
      'Publish',
      name: 'publish',
      desc: '',
      args: [],
    );
  }

  /// `All Category`
  String get allCategory {
    return Intl.message(
      'All Category',
      name: 'allCategory',
      desc: '',
      args: [],
    );
  }

  /// `All Language`
  String get allLanguage {
    return Intl.message(
      'All Language',
      name: 'allLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Flilter Courses`
  String get filterCourses {
    return Intl.message(
      'Flilter Courses',
      name: 'filterCourses',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `All Sub-Category`
  String get allSubCategory {
    return Intl.message(
      'All Sub-Category',
      name: 'allSubCategory',
      desc: '',
      args: [],
    );
  }

  /// `Pricing`
  String get pricing {
    return Intl.message(
      'Pricing',
      name: 'pricing',
      desc: '',
      args: [],
    );
  }

  /// `Level`
  String get level {
    return Intl.message(
      'Level',
      name: 'level',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `rating`
  String get Rating {
    return Intl.message(
      'rating',
      name: 'Rating',
      desc: '',
      args: [],
    );
  }

  /// `All Rating`
  String get allrating {
    return Intl.message(
      'All Rating',
      name: 'allrating',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get rating {
    return Intl.message(
      'Rating',
      name: 'rating',
      desc: '',
      args: [],
    );
  }

  /// `No More Questions`
  String get noMoreQuestions {
    return Intl.message(
      'No More Questions',
      name: 'noMoreQuestions',
      desc: '',
      args: [],
    );
  }

  /// `Loading More Questions ...`
  String get loadingMoreQuestions {
    return Intl.message(
      'Loading More Questions ...',
      name: 'loadingMoreQuestions',
      desc: '',
      args: [],
    );
  }

  /// `Questions in this course.`
  String get questionsInThisCourse {
    return Intl.message(
      'Questions in this course.',
      name: 'questionsInThisCourse',
      desc: '',
      args: [],
    );
  }

  /// `Preview`
  String get preview {
    return Intl.message(
      'Preview',
      name: 'preview',
      desc: '',
      args: [],
    );
  }

  /// `No live class is scheduled to this course yet. Please come back later.`
  String get noLiveClassIsScheduledToThisCourseYetPleaseComeBackLater {
    return Intl.message(
      'No live class is scheduled to this course yet. Please come back later.',
      name: 'noLiveClassIsScheduledToThisCourseYetPleaseComeBackLater',
      desc: '',
      args: [],
    );
  }

  /// `Zoom live class schedule`
  String get zoomLiveClassSchedule {
    return Intl.message(
      'Zoom live class schedule',
      name: 'zoomLiveClassSchedule',
      desc: '',
      args: [],
    );
  }

  /// `Join live video class`
  String get joinLiveVideoClass {
    return Intl.message(
      'Join live video class',
      name: 'joinLiveVideoClass',
      desc: '',
      args: [],
    );
  }

  /// `Subscription expired`
  String get subscriptionExpired {
    return Intl.message(
      'Subscription expired',
      name: 'subscriptionExpired',
      desc: '',
      args: [],
    );
  }

  /// `Status:`
  String get status {
    return Intl.message(
      'Status:',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get active {
    return Intl.message(
      'Active',
      name: 'active',
      desc: '',
      args: [],
    );
  }

  /// `Expired`
  String get expired {
    return Intl.message(
      'Expired',
      name: 'expired',
      desc: '',
      args: [],
    );
  }

  /// `Bundle Details`
  String get bundleDetails {
    return Intl.message(
      'Bundle Details',
      name: 'bundleDetails',
      desc: '',
      args: [],
    );
  }

  /// `Type In Search Bar...`
  String get typeInSearchBar {
    return Intl.message(
      'Type In Search Bar...',
      name: 'typeInSearchBar',
      desc: '',
      args: [],
    );
  }

  /// `Upload failed.`
  String get uploadFailed {
    return Intl.message(
      'Upload failed.',
      name: 'uploadFailed',
      desc: '',
      args: [],
    );
  }

  /// `Choose Image`
  String get chooseImage {
    return Intl.message(
      'Choose Image',
      name: 'chooseImage',
      desc: '',
      args: [],
    );
  }

  /// `Upload Image`
  String get uploadImage {
    return Intl.message(
      'Upload Image',
      name: 'uploadImage',
      desc: '',
      args: [],
    );
  }

  /// `Do you wish to remove this course?`
  String get doYouWishToRemoveThisCourse {
    return Intl.message(
      'Do you wish to remove this course?',
      name: 'doYouWishToRemoveThisCourse',
      desc: '',
      args: [],
    );
  }

  /// `Removed from wishlist.`
  String get removedFromWishlist {
    return Intl.message(
      'Removed from wishlist.',
      name: 'removedFromWishlist',
      desc: '',
      args: [],
    );
  }

  /// `Do you want remove it?`
  String get doYouWantRemoveIt {
    return Intl.message(
      'Do you want remove it?',
      name: 'doYouWantRemoveIt',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to add it?`
  String get doYouWantToAddIt {
    return Intl.message(
      'Do you want to add it?',
      name: 'doYouWantToAddIt',
      desc: '',
      args: [],
    );
  }

  /// `Added to Wishlist`
  String get addedToWishlist {
    return Intl.message(
      'Added to Wishlist',
      name: 'addedToWishlist',
      desc: '',
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
      Locale.fromSubtags(languageCode: 'de'),
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
