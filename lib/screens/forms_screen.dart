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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nova Tarefa",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        // Centraliza nosso widget Dentro do parente
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
                      return Image.asset("assets/images/no-image-icon-23483.png");
                    },
                    imageControler.text,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    print(nameControler.text);
                    print(dificuldadeControler.text);
                    print(imageControler.text);
                  },
                  child: Text("Adicionar")),
            ],
          ),
        ),
      ),
    );
  }
}
