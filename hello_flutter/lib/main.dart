import 'package:flutter/material.dart';

/// Função principal que inicia a aplicação Flutter
void main() {
  runApp(const MinhaApp());
}

/// Widget principal da aplicação que define o tema e a estrutura básica
class MinhaApp extends StatelessWidget {
  const MinhaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Título da aplicação que aparece na barra de tarefas
      title: 'Primeira App Flutter',
      
      // Configuração do tema da aplicação
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true, // Habilita o Material Design 3
      ),
      
      // Define a página inicial da aplicação
      home: const MinhaHomePage(),
    );
  }
}

/// Página inicial da aplicação que exibe a mensagem "Alô, Mundo!"
class MinhaHomePage extends StatelessWidget {
  const MinhaHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo (AppBar)
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'Minha Primeira App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      
      // Corpo do aplicativo centralizado
      body: const Center(
        child: Text(
          'Alô, Mundo!',
          style: TextStyle(
            fontSize: 30,          // Tamanho da fonte
            fontWeight: FontWeight.bold, // Peso da fonte (negrito)
          ),
        ),
      ),
    );
  }
}


