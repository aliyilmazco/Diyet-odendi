// ignore_for_file: avoid_print

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d/product/helper/helper_function.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class DatabaseService {
  final String? uid;

  DatabaseService({required this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  final CollectionReference foodsCollection =
      FirebaseFirestore.instance.collection('foods');
  final CollectionReference dateCollection =
      FirebaseFirestore.instance.collection('date');
  final CollectionReference motivationCollection =
      FirebaseFirestore.instance.collection('motivation');
  final CollectionReference chatCollection =
      FirebaseFirestore.instance.collection('chats');
  final CollectionReference recipeCollection =
      FirebaseFirestore.instance.collection('recipe');
  final CollectionReference diyetListCollection =
      FirebaseFirestore.instance.collection('diyetList');

  Future savingUserData(
    String fullName,
    String email,
    String dietationId,
    String gender,
    String age,
    String height,
    String weight,
    String targetWeight,
    String diseases,
    String note,
  ) async {
    return await userCollection.doc(uid).set(
      {
        "fullName": fullName,
        "email": email,
        "profilePic": "",
        "uid": uid,
        "dietationId": dietationId,
        "gender": gender,
        "chats": [],
        "age": age,
        "height": height,
        "weight": weight,
        "targetWeight": targetWeight,
        "diseases": diseases,
        "note": note,
      },
    );
  }

  Future<void> updateUserData(
    String uid,
    String fullName,
    String email,
    String dietationId,
    String gender,
    String age,
    String height,
    String weight,
    String targetWeight,
    String diseases,
    String note,
  ) async {
    try {
      await userCollection.doc(uid).update({
        "fullName": fullName,
        "email": email,
        "dietationId": dietationId,
        "gender": gender,
        "age": age,
        "chats": [],
        "height": height,
        "weight": weight,
        "targetWeight": targetWeight,
        "diseases": diseases,
        "note": note,
      });
      print("Kullanici verileri güncellendi.");
    } catch (e) {
      print("Kullanıcı verilerini güncellerken bir hata oluştu: $e");
    }
  }

  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();

    return snapshot;
  }

  Future getFoods2(String title) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('foods')
        .where("name", isEqualTo: title)
        .get();
    List<QueryDocumentSnapshot> documents = snapshot.docs;
    List<Map<String, dynamic>> dataList = [];
    for (QueryDocumentSnapshot document in documents) {
      Object? rawData = document.data();
      if (rawData is Map<String, dynamic>) {
        Map<String, dynamic> data = rawData;
        dataList.add(data);
      }
    }
    print('Database service get : foods/breakfast datalist: $dataList[0]');

    return dataList;
  }

  Future createDate(
      String userName,
      String id,
      String firstMonth,
      String firstDay,
      String lastMonth,
      String lastDay,
      String dietationID) async {
    try {
      await dateCollection.doc().set({
        "firstMonth": firstMonth,
        "firstDay": firstDay,
        "lastMonth": lastMonth,
        "lastDay": lastDay,
        "uid": uid,
        "dietationID": "",
        "isConfirmed": 'false',
        'doctorName': 'Not assigned yet',
        'confirmedDate': 'none',
      });
    } catch (e) {
      return "Date olusturulurken bir hata olustu: $e";
    }
  }

  Future getDate() async {
    QuerySnapshot snapshot =
        await dateCollection.where("uid", isEqualTo: uid).get();

    return snapshot;
  }

  Future<void> uploadFile(Uint8List fileData) async {
    String fullName = await HelperFunctions.getUserEmailSharedPreference();
    String fileName = "$fullName.jpg";

    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('profileImages/$fileName')
          .putData(fileData);
      print('Dosya Firestore\'a yüklendi.');
    } catch (e) {
      print('Dosya yükleme hatası: $e');
    }
  }

  Future<String?> getFileUrl(String fileName) async {
    try {
      String downloadUrl = await firebase_storage.FirebaseStorage.instance
          .ref('profileImages/$fileName')
          .getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Dosya indirme hatası: $e');
      return null;
    }
  }

  Future getMotivation() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('motivation').get();

    return snapshot;
  }

  Future createChat(String userName, String id, String chatName) async {
    DocumentReference chatDocumentReference = await chatCollection.add(
      {
        "chatName": chatName,
        "admin": id,
        "members": [],
        "chatId": "",
        "recentMessage": "",
        "recentMessageSender": "",
      },
    );
    await chatDocumentReference.update({
      "members": FieldValue.arrayUnion(["$uid"]),
      "chatId": chatDocumentReference.id,
    });

    DocumentReference userDocumentReference = userCollection.doc(uid);
    return await userDocumentReference.update(
      {
        "chats": FieldValue.arrayUnion(
          [
            (chatDocumentReference.id),
          ],
        ),
      },
    );
  }

  getChats(String chatId) async {
    return chatCollection
        .doc(chatId)
        .collection("messages")
        .orderBy("time")
        .snapshots();
  }

  sendMessage(String chatId, Map<String, dynamic> chatMessageData) async {
    chatCollection.doc(chatId).collection("messages").add(chatMessageData);
    chatCollection.doc(chatId).update({
      "recentMessage": chatMessageData['message'],
      "recentMessageSender": chatMessageData['sender'],
      "recentMessageTime": chatMessageData['time'].toString(),
    });
  }

  Future getRecipe() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('recipe').get();

    return snapshot;
  }

  Future<String?> getRecipeUrl(String recipeName) async {
    try {
      String downloadUrl = await firebase_storage.FirebaseStorage.instance
          .ref('recipeImages/$recipeName.jpg')
          .getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Recipe resim indirme hatasi: $e');
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getDiyetList(String uid) async {
    QuerySnapshot diyetListSnapshot = await FirebaseFirestore.instance
        .collection('diyetList')
        .where('uid', isEqualTo: uid)
        .get();

    List<Map<String, dynamic>> innerDataList = [];

    for (QueryDocumentSnapshot doc in diyetListSnapshot.docs) {
      CollectionReference innerCollectionRef = doc.reference.collection('List');
      QuerySnapshot innerCollectionSnapshot = await innerCollectionRef.get();

      for (QueryDocumentSnapshot innerDoc in innerCollectionSnapshot.docs) {
        innerDataList.add(innerDoc.data() as Map<String, dynamic>);
      }
    }

    return innerDataList;
  }
}
