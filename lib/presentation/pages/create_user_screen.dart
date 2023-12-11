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
            return Container();
          }

          if (state is UserCreateFailed) {
            return Text("Error");
          }

          return Column(
            children: [
              Container(
                margin:
                    EdgeInsets.only(left: 16, top: 10, right: 16, bottom: 10),
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
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  debugPrint("create");
                },
                child: Text("Create User"),
              ),
              SizedBox(
                height: 10
              ),
              FilledButton(
                onPressed: () {
                  debugPrint("post");
                },
                child: Text("Posts"),
              )
            ],
          );
        },
      ),
    );
  }
}
