import 'package:bot_toast/bot_toast.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'controllers/application_controller.dart';
import 'lang/app_translation.dart';
import 'lang/lang_service.dart';
import 'routes/app_pages.dart';
import 'theme/theme.dart';
import 'theme/theme_service.dart';
import 'utils/hidekeyboard.dart';
import 'utils/router_observer.dart';

void main() async{
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Get.put<LangService>(LangService());
  Get.put<EventBus>(EventBus());
  Get.put<ApplicationController>(ApplicationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      hideFooterWhenNotFull: true,
      headerBuilder: () => const MaterialClassicHeader(),
      footerBuilder: () => const ClassicFooter(),
      child: GetMaterialApp(
        title: 'Flutter Template',
        navigatorKey: Get.key,
        debugShowCheckedModeBanner: true,
        defaultTransition: Transition.native,
        transitionDuration: const Duration(milliseconds: 200),
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        themeMode: ThemeService().theme,
        navigatorObservers: [routeObserver, BotToastNavigatorObserver()],
        localizationsDelegates: const [
          RefreshLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: Get.find<LangService>().supportedLocales,
        locale: Get.find<LangService>().local,
        fallbackLocale: const Locale('zh', 'CN'),
        translations: TranslationService(),
        builder: (BuildContext context, Widget? child){
          Widget _child = ScreenUtilInit(
            designSize: const Size(750, 1334),
            builder: () => GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => hideKeyboard(context),
              child: child,
            ),
          );
          return BotToastInit()(context, _child);
        },
        getPages: AppPages.pages,
        initialRoute: Routes.home,
      ),
    );
  }
}

