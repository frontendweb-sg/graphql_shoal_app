import 'package:dio/dio.dart';
import 'package:graphql_shoal_app/core/constants/constants.dart';
import 'package:graphql_shoal_app/features/auth/data/models/login_response_model.dart';
import 'package:graphql_shoal_app/features/auth/data/models/register_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: AppConstants.APP_BASE_AUTH_URL)
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;

  @POST(AppConstants.APP_LOGIN_URL)
  Future<HttpResponse<LoginResponseModel>> login(
      @Body() Map<String, dynamic> payload);

  @POST(AppConstants.APP_REGISTER_URL)
  Future<HttpResponse<RegisterResponseModel>> register(
      @Body() Map<String, dynamic> payload);
}
