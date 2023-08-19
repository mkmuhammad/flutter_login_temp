part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthSendCodeEvent extends AuthEvent {
  const AuthSendCodeEvent();
}

class AuthConfirmCodeEvent extends AuthEvent {
  const AuthConfirmCodeEvent();
}

class AuthUpdateControllerEvent extends AuthEvent {
  final int hashNumber;
  final String newValue;

  const AuthUpdateControllerEvent(this.hashNumber, this.newValue);

  @override
  List<Object?> get props => [hashNumber, newValue];
}

class AuthVerifyCodeEvent extends AuthEvent {
  final int verificationCode;

  const AuthVerifyCodeEvent(this.verificationCode);
}
