import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_chat/entities/message.dart';
import 'package:yes_no_chat/providers/chat_provider.dart';
import 'package:yes_no_chat/widgets/chats/her_message_bubble.dart';
import 'package:yes_no_chat/widgets/chats/message_field_box.dart';

import '../../widgets/chats/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(4),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Dwayne_Johnson_2014_%28cropped%29.jpg/640px-Dwayne_Johnson_2014_%28cropped%29.jpg"),
            ),
          ),
          title: const Text('The Rock'),
          centerTitle: false,
        ),
        body: _ChatView());
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  controller: chatProvider.chatScrollController,
                  itemCount: chatProvider.messageList.length,
                  itemBuilder: (context, index) {
                    final message = chatProvider.messageList[index];

                    return (message.fromWho == FromWho.hers)
                        ? HerMessageBubble(
                            message: message,
                          )
                        : MyMessageBubble(
                            message: message,
                          );
                  })),
          MessageFieldBox(
            onValue: chatProvider.sendMessage,
          ),
        ],
      ),
    ));
  }
}
