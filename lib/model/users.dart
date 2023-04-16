import 'package:mychess/utils.dart';

class UserField {
  static const String lastMessageTime = 'lastMessageTime';
}

class User {
  final String idUser;
  final String name;
  final String urlAvatar;
  final DateTime lastMessageTime;

  const User({
    required this.idUser,
    required this.name,
    required this.urlAvatar,
    required this.lastMessageTime,
  });

  User copyWith({
    String? idUser,
    String? name,
    String? urlAvatar,
    DateTime? lastMessageTime,
  }) =>
      User(
        idUser: idUser ?? this.idUser,
        name: name ?? this.name,
        urlAvatar: urlAvatar ?? this.urlAvatar,
        lastMessageTime: lastMessageTime ?? this.lastMessageTime,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        idUser: json['idUser'] as String,
        name: json['name'] as String,
        urlAvatar: json['urlAvatar'] as String,
        lastMessageTime: Utils.toDateTime(json['lastMessageTime']) as DateTime,
      );

  Map<String, dynamic> toJson() => {
        'idUser': idUser,
        'name': name,
        'urlAvatar': urlAvatar,
        'lastMessageTime': lastMessageTime,
      };
}
