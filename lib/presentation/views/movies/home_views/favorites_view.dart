import 'package:flutter/material.dart';

class FavoritesView extends StatelessWidget {
  // static String 
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Favorites View'),
      ),
      body: const Center(
        child: Text('Favorites'),
      ),
    );
  }
}