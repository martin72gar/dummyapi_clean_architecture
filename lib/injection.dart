import 'package:clean_architecture/data/datasource/remote_data.dart';
import 'package:clean_architecture/data/repositories/comment_base_repository_impl.dart';
import 'package:clean_architecture/data/repositories/post_base_repository_impl.dart';
import 'package:clean_architecture/data/repositories/remote_data_impl.dart';
import 'package:clean_architecture/data/repositories/user_base_repository_impl.dart';
import 'package:clean_architecture/domain/repositories/comment_base_repository.dart';
import 'package:clean_architecture/domain/repositories/post_base_repository.dart';
import 'package:clean_architecture/domain/repositories/user_base_repository.dart';
import 'package:clean_architecture/domain/usecase/get_comment_list.dart';
import 'package:clean_architecture/domain/usecase/get_post_list.dart';
import 'package:clean_architecture/domain/usecase/user_usecase.dart';
import 'package:clean_architecture/presentation/cubit/comment/comment_cubit.dart';
import 'package:clean_architecture/presentation/cubit/post/post_cubit.dart';
import 'package:clean_architecture/presentation/cubit/user/user_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'common/errors/network_info.dart';

final locator = GetIt.instance;

void initialize() {
  //repository domain impl
  locator.registerFactory<UserBaseRepository>(
      () => UserBaseRepositoryImpl(locator()));
  locator.registerFactory<PostBaseRepository>(
      () => PostBaseRepositoryImpl(locator(), locator()));
  locator.registerFactory<CommentBaseRepository>(
      () => CommentBaseRepositoryImpl(locator()));

  //repository remote data
  locator.registerFactory(() => RemoteDataImpl(locator()));

  //usecase
  locator.registerFactory(() => CreateUseUseCase(locator()));
  locator.registerFactory(() => GetUserDetailUseCase(locator()));
  locator.registerFactory(() => GetUserListUseCase(locator()));
  locator.registerFactory(() => GetPostListUsecase(locator()));
  locator.registerFactory(() => GetCommentListUsecase(locator()));

  //state management
  locator.registerFactory(() => UserCubit(locator(), locator(), locator()));
  locator.registerFactory(() => PostCubit(locator()));
  locator.registerFactory(() => CommentCubit(locator()));

  //external library
  locator.registerFactory(() => Client());
  locator.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(internetConnectionChecker: InternetConnectionChecker()),
  );
}
