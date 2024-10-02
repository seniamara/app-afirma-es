import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _frases = [
    "Eu sou capaz de alcançar tudo o que desejo.",
    "Minha mente é clara, meu coração está em paz.",
    "Eu sou merecedora de todas as coisas boas que a vida tem a oferecer.",
    "Eu confio no processo da vida e aceito o que ela traz.",
    "Eu escolho me cercar de positividade e amor.",
    "Cada desafio é uma oportunidade de crescimento.",
    "Eu sou suficiente exatamente como sou.",
    "Minha energia é poderosa e transformadora.",
    "Eu sou grata por tudo o que tenho e pelo que está por vir.",
    "Eu me amo e me aceito plenamente todos os dias.",
  ];

  String _fraseGerada = "Clique abaixo para gerar uma frase!";

  void _gerarFrase() {
    var indiceSorteado = Random().nextInt(_frases.length);
    setState(() {
      _fraseGerada = _frases[indiceSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        title: const Text(
          "A F I R M A Ç Õ E S",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                "assets/lotus.png",
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
              Text(
                _fraseGerada,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              GestureDetector(
                onTap: _gerarFrase, // Chamando a função para gerar frase
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.pink[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Gerar Afirmação",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
