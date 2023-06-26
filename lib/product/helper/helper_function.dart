import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static String userLoggedInKey = "LOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userTargetWeightKey = "USERTARGETWEIGHTKEY";
  static String userWeightKey = "USERWEIGHTKEY";
  static String userHeightKey = "USERHEIGHTKEY";
  static String userAgeKey = "USERAGEKEY";
  static String userGenderKey = "USERGENDERKEY";
  static String userNoteKey = "USERNOTEKEY";
  static String userDietationKey = "USERDIEATATIONKEY";
  static String userPictureKey = "USERPICTUREKEY";
  static String userDiseaseKey = "USERDISEASEKEY";
  static String userChatKey = 'USERCHATKEY';

  static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(userLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserAge(String userAge) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userAgeKey, userAge);
  }

  static Future<bool> saveUserGender(String userGender) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userGenderKey, userGender);
  }

  static Future<bool> saveUserNote(String userNote) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userNoteKey, userNote);
  }

  static Future<bool> saveUserDietation(String userDietation) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userDietationKey, userDietation);
  }

  static Future<bool> saveUserPicture(String userPicture) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userPictureKey, userPicture);
  }

  static Future<bool> saveUserDisease(String userDisease) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userDiseaseKey, userDisease);
  }

  static Future<bool> saveUserName(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userNameKey, userName);
  }

  static Future<bool> saveUserChat(String userChat) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userChatKey, userChat);
  }

  static Future<bool> saveUserEmail(String userEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userEmailKey, userEmail);
  }

  static Future<bool> saveUserTargetWeight(String userTargetWeight) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userTargetWeightKey, userTargetWeight);
  }

  static Future<bool> saveUserWeight(String userWeight) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userWeightKey, userWeight);
  }

  static Future<bool> saveUserHeight(String userHeight) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userHeightKey, userHeight);
  }

  static Future<bool> getUserLoggedInSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(userLoggedInKey) ?? false;
  }

  static Future<String> getUserEmailSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmailKey) ?? '';
  }

  static Future<String> getUserNameSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userNameKey) ?? '';
  }

  static Future<String> getUserTargetWeightSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userTargetWeightKey) ?? '';
  }

  static Future<String> getUserWeightSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userWeightKey) ?? '';
  }

  static Future<String> getUserHeightSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userHeightKey) ?? '';
  }

  static Future<String> getUserAgeSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userAgeKey) ?? '';
  }

  static Future<String> getUserGenderSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userGenderKey) ?? '';
  }

  static Future<String> getUserNoteSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userNoteKey) ?? '';
  }

  static Future<String> getUserDietationSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userDietationKey) ?? '';
  }

  static Future<String> getUserPictureSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userPictureKey) ?? '';
  }

  static Future<String> getUserDiseaseSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userDiseaseKey) ?? '';
  }

  static Future<String> getUserChatSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userChatKey) ?? '';
  }
}
