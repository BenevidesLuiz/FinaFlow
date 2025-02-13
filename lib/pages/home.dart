import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Ação ao pressionar o ícone de menu
          },
        ),
        title: const Text("FinaFlow"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Ação ao pressionar o ícone de perfil de usuário
              Get.toNamed("/profile");
            },
          ),
        ],
      ),
    );
  }
}
