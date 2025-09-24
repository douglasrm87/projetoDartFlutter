import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/item_provider.dart';
import 'screens/login_screen.dart';
import 'screens/search_screen.dart';
import 'screens/add_item_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => ItemProvider(),
      child: MaterialApp(
        title: 'Estudo App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (ctx) => const LoginScreen(),
          '/search': (ctx) => const SearchScreen(),
          '/add': (ctx) => const AddItemScreen(),
        },
      ),
    );
  }
}


