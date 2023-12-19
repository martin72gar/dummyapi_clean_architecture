import 'package:clean_architecture/common/custom_loading.dart';
import 'package:clean_architecture/domain/entities/comment_entity.dart';
import 'package:clean_architecture/presentation/cubit/comment/comment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture/injection.dart' as get_it;
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListCommentScreen extends StatelessWidget {
  const ListCommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Comments",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white70,
      ),
      body: BlocProvider(
        create: (_) => get_it.locator<CommentCubit>()..getCommentList(),
        child: BlocBuilder<CommentCubit, CommentState>(
          builder: (context, state) {
            if (state is CommentLoaded) {
              return SmartRefresher(
                controller: CommentCubit.controller,
                enablePullDown: true,
                enablePullUp: true,
                onRefresh: () => context.read<CommentCubit>()..getRefresh(),
                onLoading: () => context.read<CommentCubit>()..getCommentListMore(),
                child: ListView.builder(
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
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Image.network(
                                      data.owner.picture == ''
                                          ? 'https://linkfluencer.id/storage/uploads/custom-images/martin-2023-12-05-06-18-19-4539.JPG'
                                          : data.owner.picture,
                                      height: 20,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    flex: 7,
                                    child: Text(
                                      ": ${data.owner.firstName}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "commented : ${data.publishDate}",
                                style: TextStyle(fontWeight: FontWeight.w300),
                              )
                            ],
                          ));
                    }),
              );
            }

            if (state is CommentError) {
              return Text(state.message);
            }

            return const CustomLoading();
          },
        ),
      ),
    );
  }
}
