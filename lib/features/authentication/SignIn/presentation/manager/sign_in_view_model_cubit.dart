import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/SignInEntity.dart';
import '../../domain/use_cases/SignInUseCase.dart';

part 'sign_in_view_model_state.dart';

class SignInViewModelCubit extends Cubit<SignInViewModelState> {
  SignInViewModelCubit(this.signInUseCase) : super(SignInViewModelInitial());
  static SignInViewModelCubit get(context)=>BlocProvider.of(context);

  SignInUseCase signInUseCase;
  SignIn({required String email , required String password})async{
    emit(SignInViewModelLoadingState());
    var result = await signInUseCase.call(email: email, password: password);
    result.fold((data){
      if(data.message!=null){
        emit(SignInViewModelErrorState(data.message!));
      }else{
        emit(SignInViewModelSuccessState(data));
      }
    }, (error){
      emit(SignInViewModelErrorState(error));
    });
  }
}
