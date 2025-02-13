import 'package:flutter/material.dart';

//Responsabilidades: Controle da animação do logo.
class AnimatedSplashLogo extends StatefulWidget {
  const AnimatedSplashLogo({super.key});

  @override
  State<AnimatedSplashLogo> createState() => _AnimatedSplashLogoState();
}

class _AnimatedSplashLogoState extends State<AnimatedSplashLogo>
    with SingleTickerProviderStateMixin {
  Animation<double>? _animation;
  AnimationController? _animationController;
  bool hasBlur = false;

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animationController!.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        setState(() {
          hasBlur = true;
        });
      } else if (status == AnimationStatus.reverse) {
        setState(() {
          hasBlur = false;
        });
      }
    });

    _animation = Tween<double>(begin: 50, end: 150.0).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AnimatedBuilder(
            animation: _animation!,
            child: Image.asset("assets/icons/logo.png"),
            builder: (context, chiled) {
              //o que será animado.
              return Container(
                width: _animation!.value,
                height: _animation!.value,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF00C853), // Elegant green
                      Colors.green,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  //adiciona um efeito de blur.

                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.transparent,
                    width: 3,
                  ),
                  boxShadow: !hasBlur
                      ? [
                          BoxShadow(
                            color: const Color(0xFF00C853),
                            blurRadius: 18,
                            spreadRadius: 9,
                          ),
                        ]
                      : [],
                ),
                child: chiled,
              );
            }));
  }
}
