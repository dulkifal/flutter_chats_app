import 'package:mychess/model/users.dart';
import 'package:flutter/material.dart';

class ChatHeaderWidget extends StatelessWidget {
  final List<User> users;
  const ChatHeaderWidget({super.key, required this.users});

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: const Text(
            'Chats',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              if (index == 0) {
                return Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey[200],
                    child: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                      color: Colors.blue,
                    ),
                  ),
                );
              } else {
                return Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(user.urlAvatar),
                      ),
                    ));
              }
            },
          ),
        ),
      ]));
}
