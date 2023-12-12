import 'package:clean_architecture/domain/entities/post_entity.dart';
import 'package:clean_architecture/presentation/cubit/post/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture/injection.dart' as get_it;

import '../../common/custom_loading.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

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
        create: (_) => get_it.locator<PostCubit>()..getPostList(),
        child: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            if (state is PostLoading) {
              return const CustomLoading();
            }

            if (state is PostLoaded) {
              return ListView.builder(
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
                  });
            }

            if (state is PostError) {
              return Text("Error");
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
