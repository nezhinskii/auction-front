import 'package:auction_app/data/services/service_interfaces.dart';
import 'package:auction_app/domain/models/user/user.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:auction_app/domain/models/login_response/login_response.dart';
import 'package:auction_app/domain/models/register_dto/register_dto.dart';
import 'package:auction_app/domain/models/login_dto/login_dto.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService implements IAuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @override
  @POST('/auth/register')
  Future<void> register(@Body() RegisterDto body);

  @override
  @POST('/auth/login')
  Future<LoginResponse> login(@Body() LoginDto body);

  @GET('/auth/me')
  @Headers({'Authorization': 'Bearer'})
  Future<User> getMe();
}