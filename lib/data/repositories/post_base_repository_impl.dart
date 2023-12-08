import 'package:clean_architecture/data/repositories/remote_data_impl.dart';
import 'package:clean_architecture/domain/entities/post_entity.dart';
import 'package:clean_architecture/domain/repositories/post_base_repository.dart';
import 'package:dartz/dartz.dart';

class PostBaseRepositoryImpl implements PostBaseRepository {
  final RemoteDataImpl remoteDataImpl;

  PostBaseRepositoryImpl(this.remoteDataImpl);

  @override
  Future<Either<String, List<PostEntity>>> getListPost() async {
    try {
      final result = await remoteDataImpl.listPostModel();
      return Right(result.map((e) => e.toEntity()).toList());
    } catch(e) {
      return Left(e.toString());
    }
  }
}