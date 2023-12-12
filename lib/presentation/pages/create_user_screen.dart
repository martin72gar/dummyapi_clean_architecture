import 'package:clean_architecture/common/enum_status.dart';
import 'package:clean_architecture/common/my_routes.dart';
import 'package:clean_architecture/data/model/request/create_user_request_model.dart';
import 'package:clean_architecture/presentation/cubit/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateUserScreen extends StatelessWidget {
  const CreateUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white70,
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserCreateSuccess) {
            debugPrint("success create user");
            bool isLoading = state.enumStatus == EnumStatus.loading;
            return buildRegisterForm(context, isLoading, state.message);
          }

          if (state is UserCreateLoading) {
            bool isLoading = state.enumStatus == EnumStatus.loading;
            return buildRegisterForm(context, isLoading, state.message);
          }

          if (state is UserCreateFailed) {
            debugPrint("failed create user");
            return buildRegisterForm(context, false, state.message);
          }

          return buildRegisterForm(context, false, "");
        },
      ),
    );
  }

  Column buildRegisterForm(
      BuildContext context, bool isLoading, String message) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 16, top: 10, right: 16, bottom: 10),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10)),
          child: TextField(
            controller: UserCubit.first,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(8),
                hintText: "Firstname",
                hintStyle: TextStyle(fontSize: 16, color: Colors.blue)),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10)),
          child: TextField(
            controller: UserCubit.last,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(8),
                hintText: "Lastname",
                hintStyle: TextStyle(fontSize: 16, color: Colors.blue)),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10)),
          child: TextField(
            controller: UserCubit.email,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(8),
                hintText: "Email",
                hintStyle: TextStyle(fontSize: 16, color: Colors.blue)),
          ),
        ),
        message != ""
            ? Column(children: [
                SizedBox(height: 10),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(message ?? "",
                        style: TextStyle(
                            fontStyle: FontStyle.italic, color: Colors.red))),
              ])
            : Container(),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            context.read<UserCubit>().createUser(context);
            debugPrint("create");
          },
          child: isLoading
              ? const CircularProgressIndicator()
              : const Text("Create User"),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FilledButton(
              onPressed: () {
                debugPrint("users");
              },
              child: Text("Users"),
            ),
            FilledButton(
              onPressed: () {
                debugPrint("post");
                Navigator.pushNamed(context, MyRoutes.listPostPage);
              },
              child: Text("Posts"),
            ),
            FilledButton(
              onPressed: () {
                debugPrint("comments");
                Navigator.pushNamed(context, MyRoutes.listCommentPage);
              },
              child: Text("Comments"),
            ),
          ],
        )
      ],
    );
  }
}
