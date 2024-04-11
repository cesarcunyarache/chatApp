import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(20));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        onTapOutside: (event) {
          focusNode.unfocus();
        },
        focusNode: focusNode,
        controller: textController,
        decoration: InputDecoration(
            hintText: 'Mensaje ',
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            filled: true,
            suffixIcon: IconButton(
              icon: const Icon(Icons.send_outlined),
              onPressed: () {
                final textValue = textController.value.text;
                onValue(textValue);
                textController.clear();
              },
            )),
        onFieldSubmitted: (value) {
          textController.clear();
          focusNode.requestFocus();
          onValue(value);
      
        },
      ),
    );
  }
}
