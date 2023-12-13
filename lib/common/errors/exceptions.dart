import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  final int code;
  final String message;
  const ServerException({this.code = 400, required this.message});
  @override
  List<Object?> get props => [code, message];
}

class NoInternetConnectionException extends ServerException {
  const NoInternetConnectionException()
      : super(code: 12029, message: "No Internet Connection");
}