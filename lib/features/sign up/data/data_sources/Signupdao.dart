import 'package:dartz/dartz.dart';
import 'package:papyros/features/sign%20up/data/models/Signup%20Response/SignupResponse.dart';

abstract class SignupDao{
 Future<Either<SignupResponse, String>> Signup({required String firstname,required String lastname,required
String email,required String password,
required String confirmPassword,required String phone}) ;
}