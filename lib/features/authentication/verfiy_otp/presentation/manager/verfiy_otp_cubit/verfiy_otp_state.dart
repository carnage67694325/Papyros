part of 'verfiy_otp_cubit.dart';

@immutable
sealed class VerfiyOtpState {}

final class VerfiyOtpInitial extends VerfiyOtpState {}

final class VerfiyOtpLoading extends VerfiyOtpState {}

final class VerfiyOtpFaliure extends VerfiyOtpState {
  final String errMessage;

  VerfiyOtpFaliure({required this.errMessage});
}

final class VerfiyOtpSuccess extends VerfiyOtpState {}
