import 'package:clean_architecture/common/custom_loading.dart';
import 'package:clean_architecture/domain/entities/comment_entity.dart';
import 'package:clean_architecture/presentation/cubit/comment/comment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture/injection.dart' as get_it;

class ListCommentScreen extends StatelessWidget {
  const ListCommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Comments",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white70,
      ),
      body: BlocProvider(
        create: (_) => get_it.locator<CommentCubit>()..getCommentList("0"),
        child: BlocBuilder<CommentCubit, CommentState>(
          builder: (context, state) {
            if (state is CommentLoading) {
              return const CustomLoading();
            }

            if (state is CommentLoaded) {
              return ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (BuildContext context, int index) {
                    CommentEntity data = state.list[index];
                    return Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data.post),
                            Text(data.message),
                            Text(
                              "Comment by: ${data.owner.firstName}",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "commented : ${data.publishDate}",
                              style: TextStyle(fontWeight: FontWeight.w300),
                            )
                          ],
                        ));
                  });
            }

            if (state is CommentError) {
              return Text(state.message);
            }

            return Container();
          },
        ),
      ),
    );
  }
}
