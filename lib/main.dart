import 'package:flutter/material.dart';
import 'package:sakina/core/utils/app_routers.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sakina/core/utils/app_system_ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppSystemUI.init();
  runApp(const Sakina());
}

class Sakina extends StatelessWidget {
  const Sakina({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,

      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, child) {
        return Directionality(textDirection: TextDirection.rtl, child: child!);
      },
    );
  }
}
