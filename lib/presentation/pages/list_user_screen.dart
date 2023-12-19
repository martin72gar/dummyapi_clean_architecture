import 'package:clean_architecture/common/custom_loading.dart';
import 'package:clean_architecture/common/my_routes.dart';
import 'package:clean_architecture/domain/entities/user_entity.dart';
import 'package:clean_architecture/presentation/cubit/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture/injection.dart' as get_it;
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListUserScreen extends StatelessWidget {
  const ListUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Users",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white70,
      ),
      body: BlocProvider(
        create: (_) => get_it.locator<UserCubit>()..getUserList(),
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserListLoaded) {
              return SmartRefresher(
                controller: UserCubit.controller,
                enablePullDown: true,
                enablePullUp: true,
                onRefresh: () =>
                    context.read<UserCubit>()..getUserListRefresh(),
                onLoading: () => context.read<UserCubit>()..getUserListMore(),
                child: ListView.builder(
                    itemCount: state.list.length,
                    itemBuilder: (BuildContext context, int index) {
                      UserEntity data = state.list[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, MyRoutes.detailUserPage,
                              arguments: {"id": data.id});
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Image.network(
                                data.picture,
                                width: 100,
                                height: 126,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${data.firstName} ${data.lastName}"),
                                    Text("title: ${data.title}")
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              );
            }

            return const CustomLoading();
          },
        ),
      ),
    );
  }
}
