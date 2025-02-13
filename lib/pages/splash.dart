import 'package:FinaFlow/widgets/animated_splash_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Responsabilidades: contagem de tempo e navegação para a home.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    //garante que o initState seja executado antes de qualquer outra coisa.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          Get.offNamed('/auth');
          //Navigator.pushNamed(context, '/home');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: AnimatedSplashLogo(),
        ),
      ),
    );
  }
}
