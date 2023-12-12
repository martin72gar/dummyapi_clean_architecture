import 'package:clean_architecture/domain/entities/post_entity.dart';
import 'package:clean_architecture/presentation/cubit/post/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture/injection.dart' as get_it;

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
              return CircularProgressIndicator();
            }

            if (state is PostLoaded) {
              return ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (BuildContext context, int index) {
                    PostEntity data = state.list[index];
                    return Row(
                      children: [
                        Image.network(
                          data.image,
                          width: 150,
                          height: 150,
                        ),
                        Text(data.owner.firstName),
                        Expanded(child: Text(data.text)),
                      ],
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
