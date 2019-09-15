class UserEntity {
  UserEntity({this.nickName, this.email, this.avatar});
  String nickName;
  String email;
  String avatar;

  UserEntity.fromJson(Map<String, dynamic> json) {
    nickName = json['nickName'];
    email = json['email'];
    avatar = json['avatar'];
  }
}
