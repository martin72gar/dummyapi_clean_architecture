import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final int code;
  final String message;

  const Failure({this.code = 400, required this.message});

  @override
  List<Object> get props => [code, message];
}

class ServerFailure extends Failure {
  const ServerFailure({super.code, required super.message});
}
