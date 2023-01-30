import 'package:flutter/material.dart';

import 'index.dart';

class ApplicationScreen extends StatelessWidget {
  final Widget child;
  const ApplicationScreen({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nested routes tabs'),
      ),
      body: SafeArea(child: child),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
