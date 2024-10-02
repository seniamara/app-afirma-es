import 'package:afirmacoes/descatar/data_Maneger.dart';
import 'package:flutter/material.dart';

class Listas extends StatefulWidget {
  const Listas({super.key});

  @override
  State<Listas> createState() => _ListasState();
}

class _ListasState extends State<Listas> {
  final titleController = TextEditingController();
  final desController = TextEditingController();
  @override
  void dispose() {
    titleController.dispose();
    desController.dispose();
    super.dispose();
  }

  List<DataManeger> datalist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              textfildDefault(controller: titleController, hint: "Titulo"),
              const SizedBox(
                height: 20.0,
              ),
              textfildDefault(controller: desController, hint: "Descrição"),
              const SizedBox(
                height: 20.0,
              ),
              FloatingActionButton(
                onPressed: () {
                  if (titleController.text.isEmpty &&
                      desController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Por favor, preencha todos os campos")));
                  } else {
                    setState(() {
                      datalist.add(DataManeger(
                          title: titleController.text,
                          descrption: desController.text,
                          description: desController.text));
                    });
                  }
                },
                child: const Icon(Icons.add),
              ),
            ]),
      ),
    );
  }

  Widget textfildDefault(
      {String? hint, required TextEditingController controller}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: hint,
      ),
    );
  }
}
