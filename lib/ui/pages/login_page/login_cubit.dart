import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:auction_app/data/services/service_interfaces.dart';
import 'package:auction_app/domain/models/login_dto/login_dto.dart';
import 'package:auction_app/domain/models/user/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'login_cubit.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitial;
  const factory LoginState.loading() = LoginLoading;
  const factory LoginState.success(User user, String token) = LoginSuccess;
  const factory LoginState.error(String message) = LoginError;
}

class LoginCubit extends Cubit<LoginState> {
  final IAuthService authService;
  final ISignalRService signalRService;
  final FlutterSecureStorage storage;

  LoginCubit({
    required this.authService,
    required this.signalRService,
    required this.storage,
  }) : super(const LoginState.initial());

  Future<void> login(String username, String password) async {
    emit(const LoginState.loading());
    try {
      final response = await authService.login(LoginDto(
        username: username,
        password: password,
      ));
      await storage.write(key: 'auth_token', value: response.token);
      await signalRService.startConnection();
      emit(LoginState.success(response.user, response.token));
    } on DioException catch (e) {
      emit(LoginState.error(
          e.response?.data['message'] ?? 'Invalid username or password'));
    }
  }
}