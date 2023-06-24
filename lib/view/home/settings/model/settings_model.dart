// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:typed_data';

import 'package:d/product/helper/helper_function.dart';
import 'package:d/product/service/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SettingsModel extends ChangeNotifier {
  File? image;
  String? downloadUrl;
  bool isLoading = false;

  getImage() {
    return image;
  }

  void pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      this.image = imageTemporary;
      if (await uploadImage()) {
        await downloadImage();
      }

      notifyListeners();
    } catch (e) {
      print('Image picking failed: $e');
    }
  }

  Uint8List? getFileData(File? file) {
    if (file == null) return null;
    List<int> bytes = file.readAsBytesSync();
    return Uint8List.fromList(bytes);
  }

  Future<bool> uploadImage() async {
    Uint8List? fileData = getFileData(image);
    if (fileData != null) {
      await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
          .uploadFile(fileData);
    }
    return true;
  }

  downloadImage() async {
    String fullName = await HelperFunctions.getUserEmailSharedPreference();
    String fileName = "$fullName.jpg";
    downloadUrl =
        await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
            .getFileUrl(fileName);
    if (downloadUrl != null) {
      print('Dosya indirme URL\'si: $downloadUrl');
      isLoading = false;
    } else {
      print('Dosya indirme URL\'sini alirken hata oluştu.');
    }
  }
}
