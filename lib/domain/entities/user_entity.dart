import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  UserEntity({
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

  @override
  List<Object?> get props => [id, title, firstName, lastName, picture];
}