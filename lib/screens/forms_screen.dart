import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormsScreen extends StatefulWidget {
  const FormsScreen({super.key});

  @override
  State<FormsScreen> createState() => _FormsScreenState();
}

class _FormsScreenState extends State<FormsScreen> {
  //Variável do tipo controller
  TextEditingController nameControler = TextEditingController();
  TextEditingController dificuldadeControler = TextEditingController();
  TextEditingController imageControler = TextEditingController();

  //Variavel que recebe um estado global de um form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, //nome do forms e ficar de olhos nas infos
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Nova Tarefa",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          // Centraliza nosso widget Dentro do parente
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 3)),
              height: 750,
              width: 375,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return "Insira o nome da tarefa";
                        }
                        return null; // se ja tiver informação, retorna nada
                      },
                      controller: nameControler,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Nome",
                          fillColor: Colors.white70,
                          filled: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty ||
                            int.parse(value) > 5 ||
                            int.parse(value) < 1) {
                          return 'Insira uma dificuldade entre 1 e 5';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: dificuldadeControler,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Dificuldade",
                          fillColor: Colors.white70,
                          filled: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Insira um url de imagem';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.url,
                      onChanged: (text) {
                        //muda de image
                        setState(() {});
                      },
                      controller: imageControler,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Imagem",
                          fillColor: Colors.white70,
                          filled: true),
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2, color: Colors.blue)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        //fica de olho no contexto, nas execeções e na pilha de exceptions
                        errorBuilder: (BuildContext context, Object execption,
                            StackTrace? stacktrace) {
                          return Image.asset(
                              "assets/images/no-image-icon-23483.png");
                        },
                        imageControler.text,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        //Verifica se todas as validações são válidas
                        if (_formKey.currentState!.validate()) {
                          // print(nameControler.text);
                          // print(dificuldadeControler.text);
                          // print(imageControler.text);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Criando uma nova tarefa"),
                            ),
                          );
                          Navigator.pop(context); //Volta para a tela anterior
                        }
                      },
                      child: const Text("Adicionar")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
