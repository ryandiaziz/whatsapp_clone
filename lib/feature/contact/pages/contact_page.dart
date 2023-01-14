import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/common/extension/custom_theme_extension.dart';
import 'package:whatsapp_clone/common/models/user_model.dart';
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
            itemCount: allContacts[0].length + allContacts[1].length,
            itemBuilder: (context, index) {
              late UserModel firebaseContacts;
              late UserModel phoneContacts;

              if (index < allContacts[0].length) {
                firebaseContacts = allContacts[0][index];
              } else {
                phoneContacts = allContacts[1][index - allContacts[0].length];
              }

              return index < allContacts[0].length
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (index == 0)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            child: Text(
                              "Contacts on WhatsApp",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: context.theme.greyColor,
                              ),
                            ),
                          ),
                        ListTile(
                          contentPadding: const EdgeInsets.only(
                            left: 20,
                            right: 10,
                            top: 0,
                            bottom: 0,
                          ),
                          dense: true,
                          leading: CircleAvatar(
                            backgroundColor:
                                context.theme.greyColor!.withOpacity(0.3),
                            radius: 20,
                            backgroundImage: firebaseContacts
                                    .profileImageUrl.isNotEmpty
                                ? NetworkImage(firebaseContacts.profileImageUrl)
                                : null,
                            child: firebaseContacts.profileImageUrl.isEmpty
                                ? Icon(
                                    Icons.person,
                                    size: 30,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .color,
                                  )
                                : null,
                          ),
                        )
                      ],
                    )
                  : const SizedBox();
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
