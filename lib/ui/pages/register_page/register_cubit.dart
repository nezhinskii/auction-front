import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:auction_app/data/services/service_interfaces.dart';
import 'package:auction_app/domain/models/register_dto/register_dto.dart';

part 'register_cubit.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = RegisterInitial;
  const factory RegisterState.loading() = RegisterLoading;
  const factory RegisterState.success() = RegisterSuccess;
  const factory RegisterState.error(String message) = RegisterError;
}

class RegisterCubit extends Cubit<RegisterState> {
  final IAuthService authService;

  RegisterCubit({required this.authService}) : super(const RegisterState.initial());

  Future<void> register(String username, String email, String password) async {
    emit(const RegisterState.loading());
    try {
      await authService.register(RegisterDto(
        username: username,
        email: email,
        password: password,
      ));
      emit(const RegisterState.success());
    } on DioException catch (e) {
      if (e.response?.data is List){
        emit(RegisterState.error(
            e.response?.data[0]['description'] ?? 'Registration failed'));
      } else {
        emit(RegisterState.error(
            e.response?.data['errors'][0]['description'] ?? 'Registration failed'));
      }
    }
  }
}