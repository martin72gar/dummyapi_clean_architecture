import 'package:clean_architecture/common/custom_loading.dart';
import 'package:clean_architecture/presentation/cubit/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:clean_architecture/injection.dart' as get_it;
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailUserScreen extends StatelessWidget {
  const DetailUserScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User Detail",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white70,
      ),
      body: BlocProvider(
        create: (_) => get_it.locator<UserCubit>()..getUserDetail(id),
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserDetailLoading) {
              return const CustomLoading();
            }

            if (state is UserDetailLoaded) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                      state.user.picture,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 10),
                    Text("${state.user.firstName} ${state.user.lastName}"),
                    Text("title: ${state.user.title}"),
                    Text("gender: ${state.user.gender}"),
                    Text("email: ${state.user.email}"),
                    Text("phone: ${state.user.phone}"),
                    Text("dob: ${state.user.dateOfBirth}"),
                  ],
                ),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
