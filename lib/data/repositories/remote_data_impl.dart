import 'dart:convert';

import 'package:clean_architecture/data/datasource/remote_data.dart';
import 'package:clean_architecture/data/model/comment_model.dart';
import 'package:clean_architecture/data/model/create_user_model.dart';
import 'package:clean_architecture/data/model/post_model.dart';
import 'package:clean_architecture/data/model/user_detail_model.dart';
import 'package:clean_architecture/data/model/user_model.dart';
import 'package:http/http.dart' as http;

import '../../common/const.dart';

class RemoteDataImpl implements RemoteData {
  final http.Client client;

  RemoteDataImpl(this.client);

  @override
  Future<CreateUserModel> createUserModel() async {
    final request = await http.post(Uri.parse('${Const.baseURL}user/create'),
        headers: {
          'app-id': Const.appId
        },
        body: {
          "firstName": "Martin",
          "lastName": "Siregar",
          "email": "72garmartin@mail.com"
        });

    final response = jsonDecode(request.body);
    return CreateUserModel.fromJson(response);
  }

  @override
  Future<List<CommentModel>> listCommentModel() async {
    final request = await http.get(
      Uri.parse('${Const.baseURL}comment?page=1&limit=10'),
      headers: {'app-id': Const.appId},
    );

    final response = jsonDecode(request.body);
    final List data = response['data'];
    return data.map((e) => CommentModel.fromJson(e)).toList();
  }

  @override
  Future<List<PostModel>> listPostModel() async {
    final request = await http.get(
      Uri.parse('${Const.baseURL}post?page=1&limit=10'),
      headers: {'app-id': Const.appId},
    );

    final response = jsonDecode(request.body);
    final List data = response['data'];

    return data.map((e) => PostModel.fromJson(e)).toList();
  }

  @override
  Future<List<UserModel>> listUserModel() async {
    final request = await http.get(
      Uri.parse('${Const.baseURL}user?page=0&limit=10'),
      headers: {'app-id': Const.appId},
    );

    final response = jsonDecode(request.body);
    final List data = response['data'];

    return data.map((e) => UserModel.fromJson(e)).toList();
  }

  @override
  Future<UserDetailModel> userDetailModel() async {
    final request = await http.get(
      Uri.parse('${Const.baseURL}user/6572c2c979dd15bed8c1c8d6'),
      headers: {'app-id': Const.appId},
    );

    final response = jsonDecode(request.body);

    return UserDetailModel.fromJson(response);
  }
}
