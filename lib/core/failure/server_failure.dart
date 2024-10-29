import 'failure.dart';

class ServerFailure extends Failure{
  String? error ,errorCode, massage;
  ServerFailure({
    required super.statusCode,
    this.error,
    this.errorCode,
    this.massage,
  });


}