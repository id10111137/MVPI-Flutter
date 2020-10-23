import 'package:login/Model/LoginMessage.dart';

class LoginModels {
  int code;
  List<Message> message;
  String status;

  LoginModels({this.code, this.message, this.status});

  factory LoginModels.fromJson(Map<String, dynamic> json) {
    return LoginModels(
      code: json['code'],
      message: json['message'] != null
          ? (json['message'] as List).map((i) => Message.fromJson(i)).toList()
          : null,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    if (this.message != null) {
      data['message'] = this.message.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
