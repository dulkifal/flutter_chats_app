 
import 'package:flutter/material.dart';
import 'package:mychess/api/firebase_api.dart';
import 'package:mychess/data.dart';
import 'package:mychess/model/message.dart';
import 'package:mychess/widgets/message_widget.dart';

class MessagesWidget extends StatelessWidget {
  final String idUser;
   MessagesWidget({super.key, required this.idUser});

  @override
  Widget build(BuildContext context) =>StreamBuilder<List<Message>>(
    stream: FirebaseApi.getMessages(idUser),
    builder: (context, snapshot) {
        final messages = snapshot.data;
        print('messages: $messages');
     return

     messages!.isEmpty ?

       buildText('Say Hi..')
       
      
      :ListView.builder(
          physics: const BouncingScrollPhysics(),
          reverse: true,
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[index];
            return MessageWidget(
              message: message,
              isMe: message.idUser == myId,
               idUser: idUser,
              );
          },
        );
      }  
    
  );
   Widget buildText(String text)=> Center(
    child: Text(
      text,
      style: const TextStyle(fontSize: 24),
    ),
   );
  
}