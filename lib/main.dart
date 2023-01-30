import 'dart:io';
import 'package:academy_app/providers/bundles.dart';
import 'package:academy_app/providers/course_forum.dart';
import 'package:academy_app/screens/auth_screen_private.dart';
import 'package:academy_app/screens/downloaded_course_list.dart';
import 'package:academy_app/screens/edit_password_screen.dart';
import 'package:academy_app/screens/edit_profile_screen.dart';
import 'package:academy_app/screens/sub_category_screen.dart';
import 'package:academy_app/screens/verification_screen.dart';
import 'package:academy_app/screens/webview_screen.dart';
import 'package:academy_app/screens/webview_screen_iframe.dart';
import 'package:academy_app/shared_preferences_items.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/configurations/styles.dart';
import 'generated/l10n.dart';
import 'providers/auth.dart';
import 'providers/courses.dart';
import 'providers/http_overrides.dart';
import 'providers/misc_provider.dart';
import 'providers/my_bundles.dart';
import 'providers/my_courses.dart';
import 'screens/bundle_details_screen.dart';
import 'screens/bundle_list_screen.dart';
import 'screens/courses_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/my_bundle_courses_list_screen.dart';
import 'screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'providers/categories.dart';
import 'screens/auth_screen.dart';
import 'screens/course_detail_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/tabs_screen.dart';
import 'generated/l10n.dart';
import 'l10n/L10n.dart';
import 'l10n/locale_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true);
  HttpOverrides.global = PostHttpOverrides();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        // statusBarColor:Styles.colorPrimary,
      )
  );
  runApp(  MyApp(prefs));
}

class MyApp extends StatelessWidget {
    MyApp(    this.preferences,{ Key? key}) : super(key: key);
  final SharedPreferences preferences;
    Locale getLocal(String index) {
      switch (index) {
        case 'en':
          return Locale('en');

        case 'ar':
          return Locale('ar');

        case "de":
          return Locale('de');

        default:
          return Locale('en');
      }
    }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var x;




    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Categories(),
        ),
        ChangeNotifierProxyProvider<Auth, Courses>(
          create: (ctx) => Courses([], []),
          update: (ctx, auth, prevoiusCourses) => Courses(
            prevoiusCourses == null ? [] : prevoiusCourses.items,
            prevoiusCourses == null ? [] : prevoiusCourses.topItems,
          ),
        ),
        ChangeNotifierProxyProvider<Auth, MyCourses>(
          create: (ctx) => MyCourses([], []),
          update: (ctx, auth, previousMyCourses) => MyCourses(
            previousMyCourses == null ? [] : previousMyCourses.items,
            previousMyCourses == null ? [] : previousMyCourses.sectionItems,
          ),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Languages(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Bundles(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => MyBundles(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CourseForum(),
        ),
      ],
      child:
      ChangeNotifierProvider(
        create: (context) => LocaleProvider(),
    builder: (context, child) {
    final provider = Provider.of<LocaleProvider>(context);
    x = preferences.containsKey(SharedPreferencesKeys.LanguageCode)
    ? preferences.getString(SharedPreferencesKeys.LanguageCode)
        : 'en';


    provider.setLocale(getLocal(x),shouldUpdate: false);
      return

      Consumer<Auth>(
        builder: (ctx, auth, _) =>
      ScreenUtilInit(

    designSize: Size(428 , 928 ),//1080, 1920
    minTextAdapt: true,

    splitScreenMode: true,
    builder: (BuildContext c,Widget? widget) {

    return
            MaterialApp(

           localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            S.delegate
          ],
          title: 'Academy App',
          theme: ThemeData(
            fontFamily: Styles.FontFamily,
            //'google_sans',
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
                .copyWith(secondary: kDarkButtonBg),
          ),
          supportedLocales:
          // const Locale('en', ''), // English, no country code
          // const Locale('ar', ''),
          L10n.all,
          locale:Locale('ar'),

          // preferences.containsKey(SharedPreferencesKeys.LanguageCode)
          //     ? Locale(x.toString(), '')
          //     : provider.locale,
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
          routes: {
            '/home': (ctx) => const TabsScreen(),
            AuthScreen.routeName: (ctx) => const AuthScreen(),
            AuthScreenPrivate.routeName: (ctx) => const AuthScreenPrivate(),
            SignUpScreen.routeName: (ctx) => const SignUpScreen(),
            ForgotPassword.routeName: (ctx) => const ForgotPassword(),
            CoursesScreen.routeName: (ctx) => const CoursesScreen(),
            CourseDetailScreen.routeName: (ctx) => const CourseDetailScreen(),
            // TempViewScreen.routeName: (ctx) => const TempViewScreen(),
            WebViewScreen.routeName: (ctx) => const WebViewScreen(),
            WebViewScreenIframe.routeName: (ctx) => WebViewScreenIframe(),
            EditPasswordScreen.routeName: (ctx) => const EditPasswordScreen(),
            EditProfileScreen.routeName: (ctx) => const EditProfileScreen(),
            VerificationScreen.routeName: (ctx) => const VerificationScreen(),
            DownloadedCourseList.routeName: (ctx) =>
                const DownloadedCourseList(),
            SubCategoryScreen.routeName: (ctx) => const SubCategoryScreen(),
            BundleListScreen.routeName: (ctx) => const BundleListScreen(),
            BundleDetailsScreen.routeName: (ctx) => const BundleDetailsScreen(),
            MyBundleCoursesListScreen.routeName: (ctx) =>
                const MyBundleCoursesListScreen(),
          },
        );}
      )
      );}
      )
    );
  }
}
