import 'package:dartz/dartz.dart';
import 'package:e_commerce/feature/outh/domain/entity/sign_up_request_data.dart';

import '../../../../core/failure/failure.dart';

abstract class AuthRepository{
  Future<Either<Failure,bool>> signIn(String email,String password);
  Future<Either<Failure,bool>> signUp (SignUpRequestData data);
}