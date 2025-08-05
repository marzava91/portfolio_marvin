import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:nimbus/values/values.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:nimbus/presentation/routes/app_router.dart'; 

import 'app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('es')],
      path: 'assets/translations',
      fallbackLocale: const Locale('es'),
      child: portfolio(),  // tu widget raíz
    ),
  );
}

class portfolio extends StatelessWidget {
  portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp.router(
        title: StringConst.APP_NAME,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightThemeData,          // 🌞 Tema claro
        darkTheme: AppTheme.darkThemeData,       // 🌚 Tema oscuro
        themeMode: ThemeMode.system,             // ⚙️ Usa el tema según el sistema

        // 🌐 Configuración para EasyLocalization:
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,

        routerConfig: appRouter,
      ),
    );
  }
}


