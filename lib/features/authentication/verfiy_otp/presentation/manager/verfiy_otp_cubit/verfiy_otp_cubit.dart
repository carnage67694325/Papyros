import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:papyros/features/authentication/verfiy_otp/domain/entities/verfiy_otp_entity.dart';
import 'package:papyros/features/authentication/verfiy_otp/domain/use_cases/verfiy_otp_use_case.dart';

part 'verfiy_otp_state.dart';

class VerfiyOtpCubit extends Cubit<VerfiyOtpState> {
  VerfiyOtpCubit(this.verfiyOtpUseCase) : super(VerfiyOtpInitial());
  final VerfiyOtpUseCase verfiyOtpUseCase;
  Future<void> verfiyOtp(String email, String otp) async {
    emit(VerfiyOtpLoading());
    var result = await verfiyOtpUseCase
        .call(VerfiyOtpEntity(emailEntity: email, otpEntity: otp));
    result.fold((failure) {
      emit(VerfiyOtpFaliure(errMessage: failure.errMessage));
    }, (succes) {
      emit(VerfiyOtpSuccess());
    });
  }
}
