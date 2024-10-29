import 'package:dio/dio.dart';
import 'package:e_commerce/feature/outh/domain/entity/sign_up_request_data.dart';

abstract class AuthDataSource{
  Future<Response>signIn(String email,String password);
  Future<Response>signUp(SignUpRequestData data);
}

class AuthOnLineDataSource extends AuthDataSource{
  final Dio _dio;
  AuthOnLineDataSource(this._dio);
  @override
  Future<Response> signIn(String email, String password) async{
    return await _dio.post(
        "/api/v1/auth/signin",
        data: {
          "email":email,
          "password":password,
        }
    );


  }

  @override
  Future<Response> signUp(SignUpRequestData data) async{
    return await _dio .post(
      "/api/v1/auth/signup",
      data: {
        data:data.toJson(),
      }
    );
  }

}
class AuthOffLineDataSource extends AuthDataSource{
  final Dio _dio;
  AuthOffLineDataSource(this._dio);

  @override
  Future<Response> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Response> signUp(SignUpRequestData data) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

}
