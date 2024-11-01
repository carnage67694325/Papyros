import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:papyros/features/sign%20up/domain/repositories/Signuprepo.dart';

import '../entities/Sigup entity/SignupEntity.dart';
@injectable
class SignUpUseCase{
  Signuorebo rebo;
  @factoryMethod
  SignUpUseCase( this.rebo) {
  }
  Future<Either<SignupEntity, String>>  call({required String firstname,required String lastname,required String password,required String confirmPassword,required String email,required String phone })=>rebo.Signup(firstname: firstname, lastname: lastname, email: email, password: password, confirmPassword: confirmPassword, phone: phone);
}