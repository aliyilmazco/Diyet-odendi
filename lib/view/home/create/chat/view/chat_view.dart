import 'package:d/view/home/create/chat/viewmodel/chat_viewmodel.dart';
import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends ChatViewModel {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
