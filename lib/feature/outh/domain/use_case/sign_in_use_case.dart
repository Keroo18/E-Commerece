import 'package:dartz/dartz.dart';
import 'package:e_commerce/feature/outh/domain/repositoty/auth_repository.dart';

import '../../../../core/failure/failures.dart';

class SignInUseCase{
  final AuthRepository _authRepository;
  SignInUseCase(this._authRepository);
  Future<Either<Failure,bool>>execute(String email ,String password) async {
    return await _authRepository.signIn( email, password);
  }
}