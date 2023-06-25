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

  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection("groups");

  final CollectionReference foodsCollection =
      FirebaseFirestore.instance.collection('foods');
  final CollectionReference dateCollection =
      FirebaseFirestore.instance.collection('date');
  final CollectionReference motivationCollection =
      FirebaseFirestore.instance.collection('motivation');
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
        "groups": [],
        "profilePic": "",
        "uid": uid,
        "dietationId": dietationId,
        "gender": gender,
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

  Future getUserGroups(String email) async {
    return userCollection.doc(uid).snapshots();
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

  Future createGroup(String userName, String id, String groupName) async {
    DocumentReference groupDocumentReference = await groupCollection.add(
      {
        "groupName": groupName,
        "groupIcon": "",
        "admin": "${id}_$userName",
        "members": [],
        "groupId": "",
        "recentMessage": "",
        "recentMessageSender": "",
      },
    );
    await groupDocumentReference.update({
      "members": FieldValue.arrayUnion(["${uid}_$userName"]),
      "groupId": groupDocumentReference.id,
    });

    DocumentReference userDocumentReference = userCollection.doc(uid);
    return await userDocumentReference.update(
      {
        "groups": FieldValue.arrayUnion(
          [
            "${groupDocumentReference.id}_$groupName",
          ],
        ),
      },
    );
  }

  getChats(String groupId) async {
    return groupCollection
        .doc(groupId)
        .collection("messages")
        .orderBy("time")
        .snapshots();
  }

  Future getGroupAdmin(String groupId) async {
    DocumentReference d = groupCollection.doc(groupId);
    DocumentSnapshot documentSnapshot = await d.get();
    return documentSnapshot.get("admin");
  }

  getGroupMembers(groupId) async {
    return groupCollection.doc(groupId).snapshots();
  }

  searchByName(String groupName) {
    return groupCollection.where("groupName", isEqualTo: groupName).get();
  }

  Future<bool> isUserJoined(
      String groupName, String groupId, String userName) async {
    DocumentReference userDocumentReference = userCollection.doc(uid);
    DocumentSnapshot documentSnapshot = await userDocumentReference.get();

    List<dynamic> groups = await documentSnapshot['groups'];
    if (groups.contains("${groupId}_$groupName")) {
      return true;
    } else {
      return false;
    }
  }

  Future toggleGroupJoin(
    String groupId,
    String userName,
    String groupName,
  ) async {
    DocumentReference userDocumentReference = userCollection.doc(uid);
    DocumentReference groupDocumentReference = groupCollection.doc(groupId);

    DocumentSnapshot userDocumentSnapshot = await userDocumentReference.get();

    List<dynamic> groups = userDocumentSnapshot['groups'];

    if (groups.contains("${groupId}_$groupName")) {
      await userDocumentReference.update({
        "groups": FieldValue.arrayRemove(["${groupId}_$groupName"]),
      });
      await groupDocumentReference.update({
        "members": FieldValue.arrayRemove(["${uid}_$userName"]),
      });
    } else {
      await userDocumentReference.update({
        "groups": FieldValue.arrayUnion(["${groupId}_$groupName"]),
      });
      await groupDocumentReference.update({
        "members": FieldValue.arrayUnion(["${uid}_$userName"]),
      });
    }
  }

  sendMessage(String groupId, Map<String, dynamic> chatMessageData) async {
    groupCollection.doc(groupId).collection("messages").add(chatMessageData);
    groupCollection.doc(groupId).update({
      "recentMessage": chatMessageData['message'],
      "recentMessageSender": chatMessageData['sender'],
      "recentMessageTime": chatMessageData['time'].toString(),
    });
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
}
