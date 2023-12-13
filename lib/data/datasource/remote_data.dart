import 'package:clean_architecture/data/model/comment_model.dart';
import 'package:clean_architecture/data/model/post_model.dart';
import 'package:clean_architecture/data/model/user_model.dart';

import '../model/create_user_model.dart';
import '../model/request/create_user_request_model.dart';
import '../model/user_detail_model.dart';

abstract class RemoteData {
  Future<List<UserModel>> listUserModel(String page);

  Future<List<PostModel>> listPostModel(String page);

  Future<List<CommentModel>> listCommentModel(String page);

  Future<UserDetailModel> userDetailModel(String id);

  Future<dynamic> createUserModel(
      CreateUserRequestModel userRequestModel);
}
