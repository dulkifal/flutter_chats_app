import 'package:flutter/material.dart';
import 'package:mychess/api/firebase_api.dart';

import '../widgets/chat_body_widget.dart';
import '../widgets/chat_header_widget.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseApi.getUsers(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final users = snapshot.data;

                  if (users!.isEmpty) {
                    return const Center(child: Text('No users found'));
                  } else {
                    return Column(
                      children: [
                        ChatHeaderWidget(users: users),
                        ChatBodyWidget(users: users),
                      ],
                    );
                  }
                }
            }
          },
        ),
      ));
}
