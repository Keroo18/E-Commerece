import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/failure/failures.dart';
import 'package:e_commerce/core/services/snack_bar_service.dart';
import 'package:e_commerce/feature/outh/data/data_source/auth_data_source.dart';
import 'package:e_commerce/feature/outh/data/repository_imp/auth_repository_imp.dart';
import 'package:e_commerce/feature/outh/domain/entity/sign_up_request_data.dart';
import 'package:e_commerce/feature/outh/domain/repositoty/auth_repository.dart';
import 'package:e_commerce/feature/outh/domain/use_case/sign_in_use_case.dart';
import 'package:e_commerce/feature/outh/domain/use_case/sign_up_use_case.dart';
import 'package:e_commerce/feature/outh/presentation/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../core/services/web_service.dart';

class AuthCubit extends Cubit<AuthStates>{
  final WebService _service= WebService();
  AuthCubit():super(InitialAuthStates());

  static AuthCubit get(context) =>BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameSignUpController = TextEditingController();
  TextEditingController mobileNumberSignUpController = TextEditingController();
  TextEditingController emailSignUpController = TextEditingController();
  TextEditingController passwordSignUpController = TextEditingController();

  late AuthDataSource _authDataSource;
  late AuthRepository _authRepository;
  late SignInUseCase _signInUseCase;
  late SignUpUseCase _signUpUseCase;


  Future<bool> signIn() async {
    _authDataSource=AuthOnLineDataSource(_service.freeDio);
    _authRepository=AuthRepositoryImp(_authDataSource);
    _signInUseCase=SignInUseCase(_authRepository);
    EasyLoading.show();
    final result = await _signInUseCase.execute(emailController.text, passwordController.text);
    return result.fold(
          (fail) {
        EasyLoading.dismiss();
        var error =fail as ServerFailure;
        SnackBarService.showErrorMessage(error.massage??"");
        emit(FailAuthSignInStates());
        return Future.value(false);
      },
          (data) {
        EasyLoading.dismiss();

        emit(SuccessAuthSignInStates());
        return Future.value(true);

      },);
  }
  Future<bool> signUp() async {
    _authDataSource=AuthOnLineDataSource(_service.freeDio);
    _authRepository=AuthRepositoryImp(_authDataSource);
    _signUpUseCase=SignUpUseCase(_authRepository);
    EasyLoading.show();
    var data = SignUpRequestData(
        name: nameSignUpController.text,
        email:emailSignUpController.text,
        password: passwordSignUpController.text,
        phone: mobileNumberSignUpController.text,
    );
    final result = await _signUpUseCase.execute(data);
    return result.fold(
          (fail) {
        EasyLoading.dismiss();
        var error =fail as ServerFailure;
        SnackBarService.showErrorMessage(error.massage??"");
        emit(FailAuthSignUpStates());
        return Future.value(false);
      },
          (data) {
        EasyLoading.dismiss();

        emit(SuccessAuthSignUpStates());
        return Future.value(true);

      },);
  }






}