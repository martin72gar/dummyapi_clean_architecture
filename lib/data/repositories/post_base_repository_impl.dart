import 'package:clean_architecture/data/repositories/remote_data_impl.dart';
import 'package:clean_architecture/domain/entities/post_entity.dart';
import 'package:clean_architecture/domain/repositories/post_base_repository.dart';
import 'package:dartz/dartz.dart';

import '../../common/errors/exceptions.dart';
import '../../common/errors/failure.dart';
import '../../common/errors/network_info.dart';

class PostBaseRepositoryImpl implements PostBaseRepository {
  final RemoteDataImpl remoteDataImpl;
  final NetworkInfo networkInfo;

  PostBaseRepositoryImpl(this.remoteDataImpl, this.networkInfo);

  @override
  Future<Either<String, List<PostEntity>>> getListPost(String page) async {
    if (await networkInfo.isConnected){
      try {
        final result = await remoteDataImpl.listPostModel(page);
        return Right(result.map((e) => e.toEntity()).toList());
      } catch (e) {
        return Left(e.toString());
      }
    }else {
      const e = NoInternetConnectionException();
      return Left(e.message);
    }
  }
}