import 'package:clean_architecture/data/model/post_model.dart';
import 'package:clean_architecture/domain/entities/comment_entity.dart';
import 'package:equatable/equatable.dart';

class CommentModel extends Equatable {
  CommentModel({
    required this.id,
    required this.message,
    required this.owner,
    required this.post,
    required this.publishDate,
  });

  late final String id;
  late final String message;
  late final OwnerModel owner;
  late final String post;
  late final String publishDate;

  CommentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    owner = OwnerModel.fromJson(json['owner']);
    post = json['post'];
    publishDate = json['publishDate'];
  }

  CommentEntity toEntity() => CommentEntity(
      id: id,
      message: message,
      owner: owner,
      post: post,
      publishDate: publishDate);

  @override
  List<Object?> get props => [id, message, owner, post, publishDate];
}
