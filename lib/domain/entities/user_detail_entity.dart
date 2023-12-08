import 'package:clean_architecture/data/model/user_detail_model.dart';
import 'package:equatable/equatable.dart';

class UserDetailEntity extends Equatable {
  UserDetailEntity({
    required this.id,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.picture,
    required this.gender,
    required this.email,
    required this.dateOfBirth,
    required this.phone,
    required this.location,
    required this.registerDate,
    required this.updatedDate,
  });

  late final String id;
  late final String title;
  late final String firstName;
  late final String lastName;
  late final String picture;
  late final String gender;
  late final String email;
  late final String dateOfBirth;
  late final String phone;
  late final Location location;
  late final String registerDate;
  late final String updatedDate;

  @override
  List<Object?> get props => [
    id,
    title,
    firstName,
    lastName,
    picture,
    gender,
    email,
    dateOfBirth,
    phone,
    location,
    registerDate,
    updatedDate
  ];
}

class LocationEntity extends Equatable {
  LocationEntity({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.timezone,
  });

  late final String street;
  late final String city;
  late final String state;
  late final String country;
  late final String timezone;

  @override
  List<Object?> get props => [street, city, state, country, timezone];
}
