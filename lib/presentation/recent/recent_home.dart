import 'package:flutter/material.dart';

class RecentHome extends StatefulWidget {
  const RecentHome({super.key});

  @override
  State<RecentHome> createState() => _RecentHomeState();
}

class _RecentHomeState extends State<RecentHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recent')),
      body: const Center(child: Text('Recent')),
    );
  }
}
