import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/failure/failures.dart';
import 'package:e_commerce/feature/outh/data/data_source/auth_data_source.dart';
import 'package:e_commerce/feature/outh/domain/entity/sign_up_request_data.dart';
import 'package:e_commerce/feature/outh/domain/repositoty/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImp implements AuthRepository{

  final AuthDataSource _authDataSource;
  AuthRepositoryImp(this._authDataSource);

  @override
  Future<Either<Failure,bool>>signIn(String email, String password) async {
    final response =await _authDataSource.signIn(email, password);
    try{
      if(response.statusCode==200){
        final String token= response.data["token"];
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("token", token);
        return const Right(true);
      }else{
        return Left(
          ServerFailure(
            statusCode:  response.statusCode.toString(),
            massage: response.data["massage"],
          ),
        );
      }
    } on DioException catch(dioException){
      return Left(
        ServerFailure(
          statusCode:  dioException.response?.statusCode.toString()??"",
          massage: dioException.error.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> signUp(SignUpRequestData data) async{
    final response =await _authDataSource.signUp(data);
    try{
      if(response.statusCode==201){
        final String token= response.data["token"];
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("token", token);
        return const Right(true);
      }
      else{
        return Left(
          ServerFailure(
            statusCode:  response.statusCode.toString(),
            massage: response.data["massage"],
          ),
        );
      }
    } on DioException catch(dioException){
      return Left(
        ServerFailure(
          statusCode:  dioException.response?.statusCode.toString()??"",
          massage: dioException.error.toString(),
        ),
      );
    }
  }
  
}