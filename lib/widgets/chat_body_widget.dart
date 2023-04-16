import 'package:flutter/material.dart';
import 'package:mychess/pages/chat_page.dart';

import '../model/users.dart';

class ChatBodyWidget extends StatelessWidget {
  final List<User> users;
  const ChatBodyWidget({super.key, required this.users});

  @override
  Widget build(BuildContext context) => Expanded(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: buildChats(),
        ),
      );

  Widget buildChats() => ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final user = users[index];
          return Container(
            height: 75,
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChatPage(
                          user: user,
                        )));
              },
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(user.urlAvatar),
              ),
              title: Text(
                user.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
        itemCount: users.length,
      );
}
