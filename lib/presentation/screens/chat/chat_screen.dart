import 'package:chat_app/domain/entities/message.dart';
import 'package:chat_app/presentation/providers/chat_provider.dart';
import 'package:chat_app/presentation/widget/chat/her_message_bubble.dart';
import 'package:chat_app/presentation/widget/chat/my_message_bubble.dart';
import 'package:chat_app/presentation/widget/shared/message_field_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(6.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/test.jpg'),
          ),
        ),
        title:  const Text("Milaaa 📝"),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert,))
        ],
      ),
      
      body: _ChatView(),
    );
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
                      ? HerMessageBobble(message: message)
                      : MyMessageBobble(
                          message: message,
                        );
                },
              ),
            ),
            MessageFieldBox(onValue: chatProvider.sendMessage),
          ],
        ),
      ),
    );
  }
}
