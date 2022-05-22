class UserModel {
  String? token;
  String? email;
  String? name;

  //String? tokenType;
  // int? expiresIn;
  //Null user;
  String? password;
  String? user_id;

  UserModel(
      {this.token,
      this.email,
      this.name,
      this.user_id,
      //this.tokenType,
      //this.expiresIn,
      //this.user
      this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    // email = json['email'];
    // name = json['name'];
    // user_id = json['user_id'].toString();
    //tokenType = json['token_type'];
    ///expiresIn = json['expires_in'];
    //user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    // data['email'] = this.email;
    // data['name'] = this.name;
    // data['user_id'] = this.user_id;
    //data['token_type'] = this.tokenType;
    //data['expires_in'] = this.expiresIn;
    //data['user'] = this.user;
    return data;
  }
}
