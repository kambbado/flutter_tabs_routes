import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import '../../index.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Screen'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              context.vRouter.to(PageTabRouting.homeRoute);
            },
            child: const Text('Route to home'),
          ),
        ],
      ),
    );
  }
}
