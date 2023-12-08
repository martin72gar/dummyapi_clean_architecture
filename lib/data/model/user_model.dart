import 'package:clean_architecture/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  UserModel({
    required this.id,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.picture,
  });

  late final String id;
  late final String title;
  late final String firstName;
  late final String lastName;
  late final String picture;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    picture = json['picture'];
  }

  UserEntity toEntity() => UserEntity(
      id: id,
      title: title,
      firstName: firstName,
      lastName: lastName,
      picture: picture);

  @override
  List<Object?> get props => [id, title, firstName, lastName, picture];
}
