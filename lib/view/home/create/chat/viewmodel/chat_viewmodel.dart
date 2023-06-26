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
  bool isItLastMessage = false;
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

  chatMessages(bool isItLastMessage) {
    return StreamBuilder(
      stream: chats,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 80.0),
            child: ListView.builder(
              reverse: false,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: MessageTile(
                    message: snapshot.data.docs[index]['message'],
                    sender: snapshot.data.docs[index]['sender'],
                    sentByMe:
                        Provider.of<UserModelProvider>(context).fullName ==
                            snapshot.data.docs[index]['sender'],
                  ),
                );
              },
            ),
          );
        } else {
          return Container();
        }
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
