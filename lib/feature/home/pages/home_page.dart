import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/widgets/custom_icon_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'WhatsApp',
            style: TextStyle(letterSpacing: 1),
          ),
          elevation: 1,
          actions: [
            CustomIconButton(onTap: () {}, icon: Icons.search),
            CustomIconButton(onTap: () {}, icon: Icons.more_vert),
          ],
          bottom: const TabBar(
            indicatorWeight: 3,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            splashFactory: NoSplash.splashFactory,
            tabs: [
              Tab(
                text: 'CHATS',
              ),
              Tab(
                text: 'STATUS',
              ),
              Tab(
                text: 'CALLS',
              )
            ],
          ),
        ),
      ),
    );
  }
}
