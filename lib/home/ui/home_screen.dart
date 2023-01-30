import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import '../../index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              context.vRouter.to(PageTabRouting.packageSummaryRoute);
            },
            child: const Text('Route to Summary'),
          ),
        ],
      ),
    );
  }
}
