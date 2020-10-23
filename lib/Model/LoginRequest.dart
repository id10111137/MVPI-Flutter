class LoginRequest {
  String email;
  String password;

  @override
  String toString() {
    return 'LoginRequest{email: $email, password: $password}';
  }

  String getEmail() {
    return email;
  }

  void setEmail(String email) {
    this.email = email;
  }

  String getPassword() {
    return password;
  }

  void setPassword(String password) {
    this.password = password;
  }

  LoginRequest({this.email, this.password});

  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return LoginRequest(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
