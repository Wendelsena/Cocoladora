// Importações necessárias
import 'package:cocoladora/calculadora.dart';
import 'package:flutter/material.dart';

// Função principal que inicia o aplicativo
void main() {
  runApp(CalculatorApp());
}

// Widget principal que encapsula toda a aplicação
class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cocolator',
      home: MainScreen(), // Define a tela principal do app
    );
  }
}

// Widget que representa a tela principal do aplicativo
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Método chamado ao pressionar o botão de iniciar a calculadora
  void _iniciarCalculadora() {
    debugPrint("Botão iniciar pressionado"); // Linha de debug
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CalculatorScreen()),
    ); // Navega para a tela da calculadora
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/wallpaper.jpg'), // Plano de fundo
            fit: BoxFit.cover, // Ajusta a imagem para cobrir toda a tela
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 30,
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(248, 255, 255, 244),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(0, 4),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: const Text(
                  "COCOLATOR", // Título exibido na tela principal
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 57, 29, 9),
                  ),
                ),
              ),
              const SizedBox(height: 40), // Espaçamento vertical
              ElevatedButton(
                onPressed: _iniciarCalculadora, // Função chamada ao pressionar o botão
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 57, 29, 9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(
                      color: Colors.white, // Define a cor da borda do botão
                      width: 2,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 80,
                  ),
                ),
                child: const Text(
                  "Iniciar", // Texto exibido no botão
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}