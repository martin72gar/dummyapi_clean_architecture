import 'package:equatable/equatable.dart';

import '../../data/model/post_model.dart';

class PostEntity extends Equatable{
  PostEntity({
    required this.id,
    required this.image,
    required this.likes,
    required this.tags,
    required this.text,
    required this.publishDate,
    required this.owner,
  });
  late final String id;
  late final String image;
  late final int likes;
  late final List<String> tags;
  late final String text;
  late final String publishDate;
  late final OwnerModel owner;

  @override
  List<Object?> get props => [id, image, likes, tags, text, publishDate, owner];
}

class OwnerEntity extends Equatable {
  OwnerEntity({
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