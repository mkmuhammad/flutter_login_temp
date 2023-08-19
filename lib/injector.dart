import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'login/data/datasources/auth_datasources.dart';
import 'login/data/repositories/auth_repository_impl.dart';
import 'login/domain/repositories/auth_repository.dart';
import 'login/domain/usecases/auth_confirm_code_usecase.dart';
import 'login/domain/usecases/auth_send_code_usecase.dart';
import 'login/presentation/bloc/authentication/auth_bloc.dart';

GetIt instance = GetIt.instance;

Future<void> inject() async {
  instance.registerSingleton<Dio>(Dio());

  instance.registerSingleton<AuthDataSource>(AuthDataSource(instance<Dio>()));

  instance.registerSingleton<AuthRepository>(AuthRepositoryImpl(instance<AuthDataSource>()));

  instance.registerSingleton<AuthSendCodeUsecase>(AuthSendCodeUsecase(instance<AuthRepository>()));
  instance.registerSingleton<AuthConfirmCodeUsecase>(AuthConfirmCodeUsecase(instance<AuthRepository>()));

  instance.registerSingleton<AuthBloc>(AuthBloc(instance<AuthSendCodeUsecase>(), instance<AuthConfirmCodeUsecase>()));
}
