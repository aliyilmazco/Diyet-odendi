import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d/product/service/database_service.dart';
import 'package:d/product/widget/create/message_tile.dart';
import 'package:d/view/auth/signup/model/sign_up_model.dart';
import 'package:d/view/home/create/chat/view/chat_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class ChatViewModel extends State<ChatView> {
  Stream<QuerySnapshot>? chats;

  String chatId = '';
  TextEditingController messageController = TextEditingController();
  @override
  void initState() {
    getChatID();

    super.initState();
  }

  getChatID() async {
    QuerySnapshot snapshot =
        await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
            .gettingUserData(
                Provider.of<UserModelProvider>(context, listen: false).email);
    chatId = snapshot.docs[0]['chats'][0];
    getChat();
  }

  getChat() async {
    print("chat id: $chatId");
    DatabaseService(
      uid: FirebaseAuth.instance.currentUser!.uid,
    ).getChats(chatId).then((val) {
      setState(() {
        chats = val;
      });
    });
  }

  chatMessages() {
    return StreamBuilder(
      stream: chats,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                reverse: false,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  return MessageTile(
                    message: snapshot.data.docs[index]['message'],
                    sender: snapshot.data.docs[index]['sender'],
                    sentByMe: '' == snapshot.data.docs[index]['sender'],
                  );
                },
              )
            : Container();
      },
    );
  }

  sendMessage() {
    if (messageController.text.isNotEmpty) {
      Map<String, dynamic> chatMessageMap = {
        "message": messageController.text,
        "sender":
            Provider.of<UserModelProvider>(context, listen: false).fullName,
        "time": DateTime.now().millisecondsSinceEpoch,
      };

      DatabaseService(
        uid: FirebaseAuth.instance.currentUser!.uid,
      ).sendMessage(
        chatId,
        chatMessageMap,
      );
      setState(() {
        messageController.clear();
      });
    }
  }
}
