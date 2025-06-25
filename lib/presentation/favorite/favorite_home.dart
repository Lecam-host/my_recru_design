import 'package:flutter/material.dart';

class FavoriteHome extends StatefulWidget {
  const FavoriteHome({super.key});

  @override
  State<FavoriteHome> createState() => _FavoriteHomeState();
}

class _FavoriteHomeState extends State<FavoriteHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite')),
      body: const Center(child: Text('Favorite')),
    );
  }
}
