import 'package:flutter/material.dart';
import 'package:mychess/model/users.dart';

import 'package:mychess/widgets/messages_widget.dart';

import '../widgets/new_message_widget.dart';
import '../widgets/profile_header_widget.dart';

class ChatPage extends StatefulWidget {
  final User user;
  const ChatPage({super.key, required this.user});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          children: [
            ProfileHeaderWidget(name: widget.user.name),
            Expanded(
              child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: MessagesWidget(
                    idUser: widget.user.idUser,
                  )),
            ),
            NewMessageWidget(
              idUser: widget.user.idUser,
            ),
          ],
        ),
      ));
}
