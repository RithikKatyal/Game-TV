import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:game_tv/app/ui/home_page/home_page.dart';
import 'package:game_tv/app/ui/sign_in_page/sign_in_page.dart';
import 'package:game_tv/core_utils/shared_preferences_util.dart';
import 'package:game_tv/services/config/flavor_banner.dart';
import 'package:game_tv/services/navigation/locator.dart';
import 'package:game_tv/services/navigation/navigation_service.dart';
import 'package:game_tv/services/navigation/route.dart';
import 'package:game_tv/utils/strings/app_localization_delegate.dart';
import 'package:game_tv/utils/strings/app_translations.dart';
import 'package:logging/logging.dart';

import 'core_utils/log_util.dart';
import 'core_utils/screenutil.dart';
import 'services/config/flavor_config.dart';

void baseAppSetup() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set orientation
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Status bar
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));

  // Run the application under run zoned, to catch unhandled exceptions
  await runZonedGuarded<Future<Null>>(() async {
    LogUtil().printLog(message: 'Showing main');
    bool isLogin = false;
    isLogin = await SharePreferenceData().getLogin();
    ScreenUtil.init(allowFontScaling: true);
    setupLocator();
    runApp(_App(isLogin: isLogin));
  }, (error, stackTrace) async {
    // Whenever an error occurs, call the `reportCrash` function. This will send
    // Dart errors to our dev console or Crashlytics depending on the environment.
    // await FirebaseCrashlytics.instance.recordError(error, stackTrace);
    LogUtil().printLog(
        tag: 'Main', message: 'runZonedGuarded exception: $stackTrace');
  });
}

void _configureLogger() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    if (FlavorConfig.instance.isDebug) {
      print(
          '[${rec.level.name}][${rec.time}][${rec.loggerName}]: ${rec.message}');
    }
  });
}

class _AppProviders extends StatelessWidget {
  final Widget child;

  const _AppProviders({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
    return MultiRepositoryProvider(
      providers: [],
      child: MultiBlocProvider(
        providers: [],
        child: child,
      ),
    );
  }
}

class _App extends StatelessWidget {
  final bool isLogin;
  const _App({Key? key, required this.isLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _AppProviders(
      child: MaterialApp(
        home: FlavorBanner(
          showBanner: kDebugMode,

          ///Put your HomePage widget here
          child: isLogin ? HomePage() : SignInPage(),
        ),
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: generateRoute,
        debugShowCheckedModeBanner: false,
        // routes: Routes.routes,
        supportedLocales: [
          Locale(Translations.kLanguageEnglish), // English, no country code
          Locale(Translations.kLanguageJapanese)
        ],
        localizationsDelegates: [
          ApplicationLocalizationDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      ),
    );
  }
}
