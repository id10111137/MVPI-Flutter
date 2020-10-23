class Message {
  String email;
  String id;
  String name;
  String password;
  String status;


  String getEmail() {
    return email;
  }

  void setEmail(String email) {
    this.email = email;
  }

  String getId() {
    return id;
  }

  void setId(String id) {
    this.id = id;
  }

  String getName() {
    return name;
  }

  void setName(String name) {
    this.name = name;
  }

  String getPassword() {
    return password;
  }

  void setPassword(String password) {
    this.password = password;
  }

  String getStatus() {
    return status;
  }

  void setStatus(String status) {
    this.status = status;
  }

  Message({this.email, this.id, this.name, this.password, this.status});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      email: json['email'],
      id: json['id'],
      name: json['name'],
      password: json['password'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['id'] = this.id;
    data['name'] = this.name;
    data['password'] = this.password;
    data['status'] = this.status;
    return data;
  }
}
