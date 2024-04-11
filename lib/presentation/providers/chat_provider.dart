import 'package:chat_app/config/helpers/get_yes_no_answer.dart';
import 'package:chat_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    /* Message(text: "Hola ❤️", fromWho: FromWho.me), */
   /* Message(text: "¿Como estas?", fromWho: FromWho.me), */
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      herRepley();
    }
    notifyListeners();
    moveScrollBottom();
  }

  Future<void> herRepley() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollBottom();
  }

  Future<void> moveScrollBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
