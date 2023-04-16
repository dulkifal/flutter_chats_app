import 'package:flutter/material.dart';
import 'package:mychess/model/message.dart';

class MessageWidget extends StatelessWidget {
  final Message message;
  final bool isMe;

  const MessageWidget(
      {super.key,
      required this.message,
      required this.isMe,
      required String idUser});

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(12);
    const borderRadius = BorderRadius.all(radius);

    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        if (!isMe)
          CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(message.urlAvatar),
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(16),
              constraints: const BoxConstraints(maxWidth: 140),
              decoration: BoxDecoration(
                borderRadius: isMe
                    ? borderRadius
                        .subtract(const BorderRadius.only(bottomLeft: radius))
                    : borderRadius
                        .subtract(const BorderRadius.only(bottomLeft: radius)),
              ),
              child: buildMessage(),
            ),
          )
      ],
    );
  }

  Widget buildMessage() => Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.message,
            style: TextStyle(color: isMe ? Colors.black : Colors.white),
            textAlign: isMe ? TextAlign.end : TextAlign.start,
          )
        ],
      );
}
