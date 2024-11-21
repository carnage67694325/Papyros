import 'package:papyros/core/endpoints/endpiont.dart';
import 'package:papyros/core/utils/api_service.dart';
import 'package:papyros/features/authentication/verfiy_otp/data/models/otp_model.dart';
import 'package:papyros/features/authentication/verfiy_otp/domain/entities/verfiy_otp_entity.dart';

abstract class VerfiyOtpDataSource {
  Future<VerfiyOtpEntity> verfiyOtp(
      {required String email, required String otp});
}

class VerfiyOtpDataSourceImpl implements VerfiyOtpDataSource {
  final ApiService apiService;

  VerfiyOtpDataSourceImpl({required this.apiService});
  @override
  Future<VerfiyOtpEntity> verfiyOtp(
      {required String email, required String otp}) async {
    var response = await apiService.post(
        endpoint: Endpiont.verfiyOtpEndpoint,
        body: {"email": email, "password": otp});
    return Otp.fromJson(response);
  }
}
