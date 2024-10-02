import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Appconfigprovider extends ChangeNotifier {
String appLange ='en';
static const String langKey ='language';
Appconfigprovider(){
  _loadPrefences();
}

Future<void> changeLang (String newLang) async{
  if(appLange==newLang){
    return;
  }
  appLange==newLang;
  notifyListeners();
  SharedPreferences prefs =await SharedPreferences.getInstance();
  prefs.setString(langKey, appLange);
}
void _loadPrefences() async {
  SharedPreferences prefs =await SharedPreferences.getInstance();
  String? lang =prefs.getString(langKey);

  if(lang!=null){
    appLange=lang;
  }
  notifyListeners();
}
}

