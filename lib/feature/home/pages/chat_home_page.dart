import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/routes/routes.dart';

class ChatHomePage extends StatelessWidget {
  const ChatHomePage({Key? key}) : super(key: key);

  navigateToContactPage(context) {
    Navigator.pushNamed(context, Routes.contact);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Chat Home Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigateToContactPage,
        child: const Icon(
          Icons.chat,
        ),
      ),
    );
  }
}
