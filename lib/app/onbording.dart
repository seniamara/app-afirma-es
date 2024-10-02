import 'package:afirmacoes/app/home.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Timer(const Duration(seconds: 1), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
        });
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Pegando as dimensões da tela para responsividade
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFFFFFFF), // Fundo branco
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Usando dimensões da tela para ajustar o tamanho
                ScaleTransition(
                  scale: Tween<double>(begin: 0, end: 1).animate(
                    CurvedAnimation(
                      parent: _animationController,
                      curve: Curves.ease,
                    ),
                  ),
                  child: Image.asset(
                    "assets/lotus.png",
                    width: screenWidth * 0.5, // 50% da largura da tela
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: screenHeight * 0.05), // Espaçamento
                ScaleTransition(
                  scale: Tween<double>(begin: 0, end: 1).animate(
                    CurvedAnimation(
                      parent: _animationController,
                      curve: Curves.linear,
                    ),
                  ),
                  child: Text(
                    "Encontre a paz nas afirmações",
                    style: TextStyle(
                      color: const Color(
                          0xFF000000), // Corrigi a cor para um contraste melhor
                      fontSize: screenWidth * 0.07, // 7% da largura da tela
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
