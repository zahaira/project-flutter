import 'package:corail/common/variable.dart';
import 'package:corail/pages/authentification/firstPage.dart';
import 'package:flutter/material.dart';

class LogoAnimation extends StatefulWidget {
  const LogoAnimation({super.key});

  @override
  State<LogoAnimation> createState() => _LogoAnimationState();
}

class _LogoAnimationState extends State<LogoAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.dispose();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FisrtPage(),
            ),
          );
        }
      });
    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const FisrtPage()));
        },
        child: Scaffold(
          body: Center(
            child: AnimatedBuilder(
              animation: _controller,
              child: SizedBox(
                width: 200,
                child: Image.asset('$pathImages/logo.png'),
              ),
              builder: (BuildContext context, Widget? child) {
                return Transform.scale(
                  scale: _controller.value,
                  child: child,
                );
              },
            ),
          ),
        ),
      
    );
  }
}
