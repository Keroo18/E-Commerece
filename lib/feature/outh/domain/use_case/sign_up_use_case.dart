import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/failure/failures.dart';
import 'package:e_commerce/feature/outh/domain/entity/sign_up_request_data.dart';
import 'package:e_commerce/feature/outh/domain/repositoty/auth_repository.dart';

class SignUpUseCase{
final AuthRepository _authRepository;
SignUpUseCase(this._authRepository);
Future<Either<Failure,bool>>execute(SignUpRequestData data)async{
return await _authRepository.signUp(data);
}
}