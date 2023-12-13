import 'package:clean_architecture/common/methods.dart';
import 'package:clean_architecture/domain/entities/post_entity.dart';
import 'package:clean_architecture/presentation/cubit/post/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture/injection.dart' as get_it;
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common/custom_loading.dart';

class ListPostScreen extends StatelessWidget {
  const ListPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Posts",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white70,
      ),
      body: BlocProvider(
        create: (_) => get_it.locator<PostCubit>()..getPostList("0"),
        child: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            if (state is PostLoading) {
              return const CustomLoading();
            }

            if (state is PostLoaded) {
              return SmartRefresher(
                controller: PostCubit.controller,
                enablePullUp: true,
                enablePullDown: true,

                child: ListView.builder(
                    itemCount: state.list.length,
                    itemBuilder: (BuildContext context, int index) {
                      PostEntity data = state.list[index];
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Image.network(
                              data.image,
                              width: 100,
                              height: 126,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 10),
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.text),
                                Text("Posted by: ${data.owner.firstName}", style: TextStyle(fontWeight: FontWeight.w500),)
                              ],
                            )),
                          ],
                        ),
                      );
                    }),
              );
            }

            if (state is PostError) {
              // showCustomSnackbar(state.message); //only works if using Get
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("Error: ${state.message}"));
            }

            return Container(
              child: Text("Post S"),
            );
          },
        ),
      ),
    );
  }
}
