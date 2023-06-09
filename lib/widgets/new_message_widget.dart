import 'package:flutter/material.dart';
import 'package:mychess/api/firebase_api.dart';

class NewMessageWidget extends StatefulWidget {
  final String idUser; 
  const NewMessageWidget({super.key,  required this.idUser});

  @override
  State<NewMessageWidget> createState() => _NewMessageWidgetState();
}

class _NewMessageWidgetState extends State<NewMessageWidget> {
  final _controller = TextEditingController();
  String message = '';

  Future sendMessage() async {
    FocusScope.of(context).unfocus();
    await FirebaseApi.uploadMessage(widget.idUser, message);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) => Container(
      
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      child: Row(children: <Widget>[
        Expanded(
          child: TextField(
            controller: _controller,
            textCapitalization: TextCapitalization.sentences,
            autocorrect: true,
            enableSuggestions: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[100],
              hintText: 'Send a message...',
              border: OutlineInputBorder(
                borderSide: const BorderSide(width: 0),
                gapPadding: 10,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            onChanged: (value) => setState(() {
              message = value;
            }),
          ),
        ),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: message.trim().isEmpty ? null : sendMessage,
          child:  Container(
            padding:  const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: IconButton(
              icon: const Icon(Icons.send),
              color: Colors.white,
              onPressed:  message.trim().isEmpty ? null : sendMessage,
            ),
          ),
        )
      ]));
}
