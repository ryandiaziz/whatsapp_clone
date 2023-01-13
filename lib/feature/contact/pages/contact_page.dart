import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/common/widgets/custom_icon_button.dart';
import 'package:whatsapp_clone/feature/contact/controllers/contacts_controller.dart';

class ContactPage extends ConsumerWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Select contact",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              '5 contacts',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          CustomIconButton(onTap: () {}, icon: Icons.search),
          CustomIconButton(onTap: () {}, icon: Icons.more_vert),
        ],
      ),
      body: ref.watch(contactControllerProvider).when(
        data: (allContacts) {
          return ListView.builder(
            itemCount: allContacts[1].length,
            itemBuilder: (context, index) {
              return Card(
                child: Text(allContacts[1][index].username),
              );
            },
          );
        },
        error: (e, t) {
          return null;
        },
        loading: () {
          return null;
        },
      ),
    );
  }
}
