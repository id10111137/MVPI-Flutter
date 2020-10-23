import 'package:login/Model/LoginMessage.dart';
import 'package:login/Model/LoginModels.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HellperSharePreferenced {

  HellperSharePreferenced._();

  /*
    Save SharedPrefereced
   */

  String email;
  String id;
  String name;
  String password;
  String status;

  static addStringToSF(LoginModels loginModels) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (var i = 0; i < loginModels.message.length; i++) {
      prefs.setString('email', loginModels.message[i].email);
      prefs.setString('id', loginModels.message[i].id);
      prefs.setString('name', loginModels.message[i].name);
      prefs.setString('password', loginModels.message[i].password);
      prefs.setString('status', loginModels.message[i].status);
      prefs.setBool('boolValue', true);
    }
  }

  addIntToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('intValue', 123);
  }

  addDoubleToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('doubleValue', 115.0);
  }

  addBoolToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('boolValue', true);
  }

  /*
    Read SharedPrefereced
   */



  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Message  message = Message();

    String email = prefs.getString('email');
    String id = prefs.getString('id');
    String name = prefs.getString('name');
    String password = prefs.getString('password');
    String status = prefs.getString('status');

    message.setId(id);
    message.setPassword(password);
    message.setName(name);
    message.setEmail(email);
    message.setStatus(status);
    return message;

  }

  static  OnBasicAlertPressed(context, String title, String message) {
    Alert(
      context: context,
      title: title,
      desc: message,
    ).show();
  }

  static getBoolValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool boolValue = prefs.getBool('boolValue');
    return boolValue;
  }

  getIntValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return int
    int intValue = prefs.getInt('intValue');
    return intValue;
  }

  static getDoubleValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return double
    double doubleValue = prefs.getDouble('doubleValue');
    return doubleValue;
  }
}
