import 'package:FinaFlow/controllers/user.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final user = await Get.find<UserController>().getUser;
      if (user != null) {
        Get.offNamed('/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final providers = [EmailAuthProvider()];
    return SignInScreen(
      providers: providers,
      actions: [
        AuthStateChangeAction<SignedIn>((context, state) async {
          Get.find<UserController>().setUserToken =
              await state.user?.getIdToken();
          Get.offNamed('/home');
        }),
        AuthStateChangeAction<UserCreated>((context, state) {
          Get.offNamed('/home');
        }),
      ],
      headerBuilder: (context, constraints, shrinkoffset) {
        return Image.asset(
          'assets/logo.png',
          width: constraints.maxWidth,
          height: constraints.maxHeight,
        );
      },
    );
  }

  void onSignedIn() {
    // Handle the sign-in action here
  }
}
