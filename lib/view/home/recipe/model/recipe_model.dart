// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../../../product/service/database_service.dart';

class RecipeModel extends ChangeNotifier {
  QuerySnapshot? snapshot;
  List<String?> calories = [];
  List<String?> ingredients = [];
  List<String?> recipeImages = [];
  List<String?> recipeName = [];
  List<String?> recipeSteps = [];
  int recipeNumber = 0;
  int selectedIndex = 0;

  setRecipeName(
    String name,
    String images,
    String steps,
    String ingredients,
    String calories,
  ) {
    recipeName.add(name);
    recipeImages.add(images);
    recipeSteps.add(steps);
    this.ingredients.add(ingredients);
    this.calories.add(calories);

    notifyListeners();
  }

  Future<void> getRecipe() async {
    snapshot =
        await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
            .getRecipe();
    for (int i = 0; i < snapshot!.docs.length; i++) {
      recipeName.add(snapshot!.docs[i]['recipeName']);
      recipeImages.add(
          await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
              .getRecipeUrl(snapshot!.docs[i]['recipeName'].trim()));
      recipeSteps.add(snapshot!.docs[i]['recipeSteps']);
      ingredients.add(snapshot!.docs[i]['ingredients']);
      calories.add(snapshot!.docs[i]['calories']);
      print("${recipeName[i]!.trim()}.jpg");
      getRecipeNumber();
    }
  }

  getRecipeNumber() {
    if (snapshot!.docs.isNotEmpty) {
      recipeNumber = snapshot!.docs.length;
    }
  }
}
