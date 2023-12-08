import 'package:clean_architecture/data/model/post_model.dart';
import 'package:equatable/equatable.dart';

class CommentEntity extends Equatable {
  CommentEntity({
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

  @override
  List<Object?> get props => [id, message, owner, post, publishDate];
}