class UserModel {
  String? uid;
  String? email;
  String? username;
  String? nomor;

  UserModel({this.uid, this.email, this.username, this.nomor});

  // data dari server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        username: map['username'],
        nomor: map['nomor']);
  }

  Map<String, dynamic> toMap() {
    return {'uid': uid, 'email': email, 'username': username, 'nomor': nomor};
  }
}
