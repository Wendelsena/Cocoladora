import 'package:flutter/material.dart'; 

void main() {
  runApp(MyApp()); 
}

// Criação de um widget chamado `MyApp` que estende `StatelessWidget`.
class MyApp extends StatelessWidget { // `StatelessWidget` é um tipo de widget que não possui estado mutável, ou seja, ele é ideal para construir partes da interface que não precisam ser atualizadas dinamicamente após a criação.
  const MyApp({super.key}); // O `super.key` é usado para passar a chave ao widget pai (`StatelessWidget`). Isso ajuda na identificação de widgets e em processos como reconstrução eficiente.

  @override // Indica que o método abaixo está substituindo um método da classe pai (`StatelessWidget`).
  Widget build(BuildContext context) { // Método `build()` é responsável por construir a interface do usuário e recebe `BuildContext context` que contém informações sobre o local do widget na árvore de widgets.

    return MaterialApp( // `MaterialApp` é a base do aplicativo que fornece estrutura para usar componentes de Material Design.
      home: Scaffold(  // `Scaffold` fornece a estrutura básica de uma página, como barra de app, corpo, rodapé, etc.
        body: Container( // `Container` é um widget versátil que pode conter outros widgets e permite customização como margem, padding, alinhamento, etc.
          decoration: const BoxDecoration(  // `BoxDecoration` é usado para decorar o `Container`, adicionando um plano de fundo, borda, etc.
            image: DecorationImage(  // `DecorationImage` define uma imagem como decoração do `Container`.
              image: AssetImage('assets/wallpaper.jpg'),  // `AssetImage` é usado para carregar uma imagem dos recursos do aplicativo.
              fit: BoxFit.cover, // para fazer a imagem ocupar a tela toda.
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric( // Define o preenchimento interno
                    vertical: 20, // Aumenta a margem interna vertical
                    horizontal: 30, // Aumenta a margem interna horizontal
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(248, 255, 255, 244), // Cor de fundo do Container
                    borderRadius: BorderRadius.circular(10), // Arredondamento das bordas
                    boxShadow: const [ // Adiciona sombra
                      BoxShadow(
                        color: Colors.black38, // Cor da sombra
                        offset: Offset(0, 4), // Posição da sombra
                        blurRadius: 10, // Difusão da sombra
                        spreadRadius: 1, // Espalhamento da sombra
                      ),
                    ],
                  ),
                  child: const Text(
                    "COCOLATOR",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 57, 29, 9),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: (){}, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 57, 29, 9),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide( // borda branca no botão
                      color: Colors.white,
                      width: 2,
                    )
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 80,
                    ),
                  ),
                  child: const Text(
                    "Iniciar",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20),
                  ),
                )
              ],
            )  // `Center` alinha seu filho no centro do widget pai.
          ),
        ),
      ),
    );
  }
}
