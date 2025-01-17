import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/screens/chat/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/screens/chat/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/screens/chat/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/screens/chat/widgets/chat/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tom Cruise'),
        leading: const Padding(
          padding: EdgeInsets.all(3),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://w7.pngwing.com/pngs/350/911/png-transparent-tom-cruise-top-gun-maverick-hollywood-actor-film-tom-cruise-celebrities-film-action-film.png'),
          ),
        ),
        centerTitle: false,
      ),
      body: _Chat_view(),
    );
  }
}

class _Chat_view extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
              controller:chatProvider.chatScrollcontroller ,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];

                return (message.fromWho == FromWho.hers)
                    ? HerMessageBubble(message: message)
                    : MyMessageBubble( message: message);
              },
            )),
            //caja de texto  de mensaje
             MessageFieldBox(
              onValue: (value)=> chatProvider.sendMessage(value),
             ),
          ],
        ),
      ),
    );
  }
}
