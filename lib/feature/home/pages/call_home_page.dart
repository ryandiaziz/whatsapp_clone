import 'package:flutter/material.dart';

class CalltHomePage extends StatelessWidget {
  const CalltHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Call Home Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.call,
        ),
      ),
    );
  }
}
