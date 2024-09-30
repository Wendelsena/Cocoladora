import 'dart:ui'; // Import necessário para o BackdropFilter
import 'package:flutter/material.dart';

// Classe que representa a lógica da calculadora
class Calculadora {
  String operand1 = ""; // Armazena o primeiro operando
  String operand2 = ""; // Armazena o segundo operando
  String operator = ""; // Armazena o operador selecionado (+, -, *, /)

  // Método que realiza o cálculo com base nos operandos e no operador
  String calculate(String displayText) {
    if (displayText.isNotEmpty && operand1.isNotEmpty) {
      operand2 = displayText; // Atribui o texto de exibição ao segundo operando
      double result = 0;

      // Realiza a operação de acordo com o operador selecionado
      switch (operator) {
        case "+":
          result = double.parse(operand1) + double.parse(operand2);
          break;
        case "-":
          result = double.parse(operand1) - double.parse(operand2);
          break;
        case "*":
          result = double.parse(operand1) * double.parse(operand2);
          break;
        case "/":
          if (double.parse(operand2) != 0) {
            result = double.parse(operand1) / double.parse(operand2);
          } else {
            return "Erro"; // Evita divisão por zero
          }
          break;
      }

      // Limpa os operandos e o operador após o cálculo
      operand1 = "";
      operand2 = "";
      operator = "";
      return result.toString(); // Retorna o resultado como uma string
    }
    return ""; // Retorna uma string vazia se não houver cálculo
  }

  // Método chamado quando um número é pressionado
  void numberPressed(String number) {
    if (operator.isEmpty) {
      operand1 += number; // Adiciona ao primeiro operando
    } else {
      operand2 += number; // Adiciona ao segundo operando
    }
  }

  // Método chamado quando um operador é pressionado
  void operatorPressed(String op) {
    operator = op; // Atribui o operador selecionado
  }

  // Método para limpar os valores da calculadora
  void clear() {
    operand1 = "";
    operand2 = "";
    operator = "";
  }
}

// Tela da calculadora, usando StatefulWidget para lidar com o estado
class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String displayText = ""; // Armazena o texto exibido na tela
  final Calculadora calculadora = Calculadora(); // Instância da calculadora

  // Método chamado ao pressionar um número
  void numberPressed(String number) {
    setState(() {
      calculadora.numberPressed(number);
      displayText += number; // Atualiza o texto de exibição
    });
  }

  // Método chamado ao pressionar um operador
  void operatorPressed(String op) {
    setState(() {
      if (displayText.isNotEmpty) {
        calculadora.operatorPressed(op);
        displayText = ""; // Limpa a tela para receber o segundo operando
      }
    });
  }

  // Método chamado para calcular o resultado
  void calculate() {
    setState(() {
      String result = calculadora.calculate(displayText);
      displayText = result.isEmpty ? "" : result; // Atualiza o resultado
    });
  }

  // Método chamado para limpar a calculadora
  void clear() {
    setState(() {
      calculadora.clear();
      displayText = ""; // Limpa o texto de exibição
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack( // Usando Stack para sobrepor widgets
        children: [
          // Imagem de fundo com desfoque
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/wallpaper.jpg'), // Imagem de fundo
                fit: BoxFit.cover, // Ajusta a imagem para cobrir toda a tela
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // Aplica desfoque
            child: Container(
              color: Colors.black.withOpacity(0), // Camada transparente
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(20.0),
                alignment: Alignment.centerRight,
                child: Text(
                  displayText,
                  style: const TextStyle(fontSize: 48, color: Colors.white), // Cor do texto
                ),
              ),
              // Teclado da calculadora
              GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  // Botões numéricos
                  ...List.generate(10, (index) {
                    return ElevatedButton(
                      onPressed: () => numberPressed(index.toString()),
                      child: Text(index.toString()),
                    );
                  }),
                  // Botões de operações
                  ElevatedButton(
                    onPressed: () => operatorPressed("+"),
                    child: const Text("+"),
                  ),
                  ElevatedButton(
                    onPressed: () => operatorPressed("-"),
                    child: const Text("-"),
                  ),
                  ElevatedButton(
                    onPressed: () => operatorPressed("*"),
                    child: const Text("*"),
                  ),
                  ElevatedButton(
                    onPressed: () => operatorPressed("/"),
                    child: const Text("/"),
                  ),
                  ElevatedButton(
                    onPressed: calculate,
                    child: const Text("="),
                  ),
                  ElevatedButton(
                    onPressed: clear,
                    child: const Text("C"),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                // Ação do botão de voltar
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
