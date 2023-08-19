part of 'auth_bloc.dart';

enum AccountState { login, done, register, verify }

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInit extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthSendCodeLoading extends AuthInit{}
class AuthSendingCodeDone extends AuthInit{}
class AuthSendingCodeFailed extends AuthInit{}

class AuthConfirmationLoading extends AuthSendingCodeDone{}
class AuthConfirmationDone extends AuthSendingCodeDone{}
class AuthConfirmationFailed extends AuthSendingCodeFailed{}

class AuthInitialState extends AuthState {
  final bool isUserRegistered;
  AccountState? accountState;

  AuthInitialState({required this.isUserRegistered, this.accountState}) {
    accountState ??= AccountState.login;
  }

  @override
  List<Object?> get props => [isUserRegistered, accountState?.index ?? 0];

  Map<String, dynamic> toJson() {
    return {
      'accountState': accountState?.index ?? 0,
      'isUserRegistered': isUserRegistered,
    };
  }

  factory AuthInitialState.fromJson(Map<String, dynamic> map) {
    return AuthInitialState(
      accountState: AccountState.values[map['accountState'] as int],
      isUserRegistered: map['isUserRegistered'] as bool,
    );
  }

  AuthInitialState copyWith({
    bool? isUserRegistered,
    bool? isDialogShowed,
    AccountState? accountState,
  }) {
    return AuthInitialState(
      isUserRegistered: isUserRegistered ?? this.isUserRegistered,
      accountState: accountState ?? this.accountState,
    );
  }
}

class AuthLoading extends AuthInitialState {
  AuthLoading({
    super.accountState,
    required super.isUserRegistered,
  });
}

class AuthError extends AuthInitialState {
  AuthError({
    super.accountState,
    required super.isUserRegistered,
  });
}

class AuthLoginDone extends AuthInitialState {
  AuthLoginDone({
    super.accountState,
    required super.isUserRegistered,
  });
}

class AuthVerifyDone extends AuthInitialState {
  AuthVerifyDone({required super.isUserRegistered, super.accountState});
}

class AuthVerifyFailed extends AuthInitialState {
  AuthVerifyFailed({required super.isUserRegistered, super.accountState});
}

class AuthRegisterDone extends AuthInitialState {
  AuthRegisterDone({
    super.accountState,
    required super.isUserRegistered,
  });
}
