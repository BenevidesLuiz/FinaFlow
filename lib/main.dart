import 'package:FinaFlow/binds/user.dart';
import 'package:FinaFlow/firebase_options.dart';
import 'package:FinaFlow/i10/auth.dart';
import 'package:FinaFlow/pages/auth.dart';
import 'package:FinaFlow/pages/home.dart';
import 'package:FinaFlow/pages/profile.dart';
import 'package:FinaFlow/pages/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';

bool shouldUseFirebaseEmulator = false;

late final FirebaseApp app;
late final FirebaseAuth auth;

Future<void> main() async {
  await initializeDateFormatting('pt_BR', null);

  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: [
        FirebaseUILocalizations.withDefaultOverrides(const LabelOverrides()),
        FirebaseUILocalizations.delegate,
      ],
      title: 'FinaFlow',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00C853)),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/auth', page: () => AuthPage(), binding: UserBind()),
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(name: '/home', page: () => const Home(), binding: UserBind()),
        GetPage(
            name: '/profile', page: () => const Profile(), binding: UserBind()),
        //aqui vai as rotas e paginas...
      ],
    );
  }
}
