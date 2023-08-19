import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../../../core/data_state/data_state.dart';
import '../../../domain/entities/auth_login_entity.dart';
import '../../../domain/usecases/auth_confirm_code_usecase.dart';
import '../../../domain/usecases/auth_send_code_usecase.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  var phoneController = TextEditingController();
  var codeController = TextEditingController();
  final codeFocusNode = FocusNode();

  final AuthSendCodeUsecase _authSendCodeUsecase;
  final AuthConfirmCodeUsecase _authConfirmCodeUsecase;

  String? mainNum;

  AuthBloc(this._authSendCodeUsecase, this._authConfirmCodeUsecase) : super(AuthInit()) {
    on<AuthSendCodeEvent>(_sendCodeEvent);
    on<AuthConfirmCodeEvent>(_confirmCodeEvent);
  }

  _sendCodeEvent(AuthSendCodeEvent event, Emitter<AuthState> emitter) async {
    if (phoneController.text == '') {
      EasyLoading.showError('Enter a Number');
    } else if (phoneController.text.length >= 10 && phoneController.text.length <= 13) {
      emitter(AuthSendCodeLoading());
      mainNum = _mainNumberPart(phoneController.text);

      if (mainNum == null) {
        emitter(AuthSendingCodeFailed());
      } else {
        DataState state = await _authSendCodeUsecase.call(param: mainNum);

        if (state is DataSuccess && state.data == true) {
          emitter(AuthSendingCodeDone());
        } else {
          emitter(AuthSendingCodeFailed());
        }
      }
    } else {
      EasyLoading.showError('Invalid Number');
      emitter(AuthSendingCodeFailed());
    }
  }

  String? _mainNumberPart(String number) {
    if (number.length == 10 && number.startsWith('9') && (!number.startsWith('98'))) {
      //inputs like: 9120000000 - except wrong format like 9891200000 <= unComplete Number
      return number;
    }
    if (number.length == 11 && number.startsWith('0')) {
      //inputs like: 09120000000 which starts with 0
      return number.substring(1);
    }
    if (number.length == 12 && number.startsWith('98')) {
      //989120000000
      return number.substring(2);
    }
    if (number.length == 13 && number.startsWith('+')) {
      //+989120000000
      return number.substring(3);
    }
    return null;
  }

  _confirmCodeEvent(AuthConfirmCodeEvent event, Emitter<AuthState> emitter) async {
    if (codeController.text == '') {
      EasyLoading.showError('Enter the Code');
    } else {
      emitter(AuthConfirmationLoading());
      mainNum = _mainNumberPart(phoneController.text);
      Map<String, String> credentials = {'PhoneNumber': mainNum ?? '', 'Code': codeController.text};
      DataState state = await _authConfirmCodeUsecase.call(param: credentials);
      if (state is DataSuccess) {
        AuthLoginEntity entity = state.data as AuthLoginEntity;
        if (entity.errorMsg == null && entity.token != null && entity.token != '') {
          emitter(AuthConfirmationDone());
        }
        if (entity.errorMsg != null) {
          codeFocusNode.unfocus();
          emitter(AuthSendingCodeDone());
          EasyLoading.showToast(entity.errorMsg!, toastPosition: EasyLoadingToastPosition.bottom);
        }
      } else {
        emitter(AuthConfirmationFailed());
      }
    }
  }

  ///emit first initial state
  // Future<void> _onAuthInitialEvent(AuthCheckUserEvent event, Emitter<AuthState> emitter) async {
  //   ///check if user is authenticated or not
  //
  //   emitter(
  //     AuthInitialState(
  //       isUserRegistered: _isAuth(),
  //     ),
  //   );
  // }
  //
  // ///is there any token for this user or not?
  // bool _isAuth() {
  //   return MyPrefs().getBool(IS_USER_KEY) ?? false;
  // }
  //
  // ///save the token in shared preferences
  // Future<void> _setAuth(bool auth) async {
  //   await MyPrefs().setBool(IS_USER_KEY, auth);
  // }
  //
  // ///save if user is artist or not in shared preferences
  // Future<void> _setIsArtist(bool isArtist) async {
  //   await MyPrefs().setBool(IS_ARTIST_KEY, isArtist);
  // }
  //
  // /// add token to shared preferences and set user as authenticated
  // Future<void> _setToken(String token) async {
  //   await MyPrefs().setString(TOKEN_KEY, token).then((value) async {
  //     await _setAuth(true);
  //   });
  // }
  //
  // ///login functionality
  // void _onLoginEvent(AuthLoginEvent event, Emitter<AuthState> emitter) async {
  //   if ((emailController.text.isEmpty) || (passwordController.text.isEmpty)) {}
  //
  //   //emit loading
  //   emitter(
  //     AuthLoading(
  //       isUserRegistered: (state as AuthInitialState).isUserRegistered,
  //     ),
  //   );
  //
  //   Map<String, String> loginCredentials = {'email': emailController.text, 'password': passwordController.text};
  //   DataState<AuthLoginEntity> loginDataState = await _authLoginUsecase.call(param: loginCredentials);
  //
  //   if (loginDataState is DataSuccess) {
  //     var token = loginDataState.data?.token;
  //     loginCredentials.putIfAbsent('name', () => loginDataState.data?.user?.name ?? '');
  //     loginCredentials.putIfAbsent('username', () => loginDataState.data?.user?.username ?? '');
  //     loginCredentials.putIfAbsent('mobile_number', () => loginDataState.data?.user?.mobileNumber ?? '');
  //
  //     await _setIsArtist(false);
  //     if ((loginDataState.data?.user?.role ?? []).isNotEmpty) {
  //       debugPrint(loginDataState.data?.user?.role![0]);
  //       if (loginDataState.data?.user?.role![0] == "artist") {
  //         await _setIsArtist(true);
  //       }
  //     }
  //
  //     // await _setToken(token!);
  //     bool credentialSaved = await _saveCredentials("$token", loginCredentials);
  //     if (credentialSaved) {
  //       emitter(
  //         AuthLoginDone(
  //           accountState: AccountState.done,
  //           isUserRegistered: true,
  //         ),
  //       );
  //     } else {
  //       emitter(
  //         AuthError(
  //           isUserRegistered: (state as AuthInitialState).isUserRegistered,
  //         ),
  //       );
  //     }
  //   }
  //
  //   if (loginDataState is DataError) {
  //     emitter(
  //       AuthError(
  //         isUserRegistered: (state as AuthInitialState).isUserRegistered,
  //       ),
  //     );
  //   }
  // }
  //
  // Future<bool> _saveCredentials(String token, Map<String, dynamic> credentials) async {
  //   bool savingToken = await MyPrefs().setString(TOKEN_KEY, token);
  //   bool isCredentialAvailable = (await MyPrefs().getString(USER_CREDENTIALS_KEY)?.isNotEmpty ?? false);
  //   if (!isCredentialAvailable) {
  //     await MyPrefs().setString(USER_CREDENTIALS_KEY, jsonEncode(credentials));
  //   }
  //   bool setUserAuth = await MyPrefs().setBool(IS_USER_KEY, true);
  //   return (savingToken && setUserAuth);
  // }
  //
  // Future<bool> _deleteCredentials() async {
  //   bool deletingToken = await MyPrefs().remove(TOKEN_KEY);
  //   bool deletingCredentials = await MyPrefs().remove(USER_CREDENTIALS_KEY);
  //   bool deletingUserAuth = await MyPrefs().remove(IS_USER_KEY);
  //   return (deletingToken && deletingCredentials && deletingUserAuth);
  // }
  //
  // void _onAuthLogoutEvent(AuthLogOutEvent event, Emitter<AuthState> emitter) async {
  //   emitter(
  //     AuthLoading(
  //       isUserRegistered: (state as AuthInitialState).isUserRegistered,
  //     ),
  //   );
  //   bool delete = await _deleteCredentials();
  //
  //   if (delete) {
  //     emitter(AuthLogout());
  //     MyEasyLoading.showToast('You Logged Out!');
  //   } else {
  //     emitter(
  //       AuthError(
  //         isUserRegistered: (state as AuthInitialState).isUserRegistered,
  //       ),
  //     );
  //   }
  // }
  //
  // void _onAuthRegisterEvent(AuthRegisterEvent event, Emitter<AuthState> emitter) async {
  //   Map<String, String> registerCredentials = {
  //     "name": nameController.text,
  //     "email": emailController.text,
  //     "mobile_number": phoneController.text,
  //     "password": passwordController.text,
  //     "password_confirmation": registerPasswordController.text,
  //     "birthday": birthdayController.text,
  //     "language": "en"
  //   };
  //
  //   emitter(
  //     AuthLoading(
  //       accountState: (state as AuthInitialState).accountState,
  //       isUserRegistered: (state as AuthInitialState).isUserRegistered,
  //     ),
  //   );
  //
  //   DataState<AuthRegisterEntity> registerDataState = await _authRegisterUsecase.call(param: registerCredentials);
  //
  //   if (registerDataState is DataSuccess) {
  //     bool saveCredentials = await MyPrefs().setString(USER_CREDENTIALS_KEY, jsonEncode(registerCredentials));
  //
  //     emitter(
  //       AuthRegisterDone(
  //         accountState: AccountState.register,
  //         isUserRegistered: (state as AuthInitialState).isUserRegistered,
  //       ),
  //     );
  //   }
  //
  //   if (registerDataState is DataError) {
  //     emitter(
  //       AuthError(
  //         accountState: (state as AuthInitialState).accountState,
  //         isUserRegistered: (state as AuthInitialState).isUserRegistered,
  //       ),
  //     );
  //   }
  // }
  //
  // void _onAuthVerify(AuthVerifyCodeEvent event, Emitter<AuthState> emitter) async {
  //   emitter(AuthLoading(
  //     accountState: AccountState.verify,
  //     isUserRegistered: (state as AuthInitialState).isUserRegistered,
  //   ));
  //
  //   var params = {'email': emailController.text, 'verificationCode': event.verificationCode};
  //   DataState<bool> verificationDataState = await _authVerifyCodeUsecase.call(param: params);
  //
  //   if (verificationDataState is DataSuccess) {
  //     if (verificationDataState.data == true) {
  //       ///registration done : move to login screen
  //       emitter(
  //         AuthVerifyDone(
  //           accountState: AccountState.login,
  //           isUserRegistered: true,
  //         ),
  //       );
  //     } else {
  //       ///registration failed, resend email
  //       emitter(
  //         AuthVerifyDone(
  //           accountState: AccountState.register,
  //           isUserRegistered: false,
  //         ),
  //       );
  //       MyEasyLoading.showError('Failed, Try Again');
  //     }
  //   } else {
  //     ///server didn't respond well try resending email again
  //     emitter(
  //       AuthVerifyDone(
  //         accountState: AccountState.register,
  //         isUserRegistered: false,
  //       ),
  //     );
  //     MyEasyLoading.showError('Network Error');
  //   }
  // }
  //
  // void _onResendCode(ResendVerificationCodeEvent event, Emitter<AuthState> emitter) async {
  //   emitter(AuthLoading(
  //     accountState: AccountState.verify,
  //     isUserRegistered: (state as AuthInitialState).isUserRegistered,
  //   ));
  //   DataState<bool> resendCodeDataState = await _verifyResendCodeUsecase.call(param: event.email);
  //
  //   if (resendCodeDataState is DataSuccess) {
  //     if (resendCodeDataState.data == true) {
  //       MyEasyLoading.showSuccess('Code Resent');
  //       emitter(AuthResendingDone(isUserRegistered: false, accountState: (state as AuthInitialState).accountState));
  //     } else {
  //       MyEasyLoading.showError('Resent Failed, Try Again');
  //       emitter(AuthResendingFailed());
  //     }
  //   } else {
  //     MyEasyLoading.showError('Network Failed Resending');
  //     emitter(AuthResendingFailed());
  //
  //   }
  // }
  //
  // void _onAuthUpdateControllers(AuthUpdateControllerEvent event, Emitter<AuthState> emitter) {
  //   if (event.hashNumber == emailController.hashCode) {
  //     emailController.text = event.newValue;
  //   }
  //
  //   if (event.hashNumber == passwordController.hashCode) {
  //     passwordController.text = event.newValue;
  //   }
  //
  //   if (event.hashNumber == registerPasswordController.hashCode) {
  //     registerPasswordController.text = event.newValue;
  //   }
  //
  //   if (event.hashNumber == phoneController.hashCode) {
  //     phoneController.text = event.newValue;
  //   }
  //
  //   if (event.hashNumber == nameController.hashCode) {
  //     nameController.text = event.newValue;
  //   }
  //
  //   if (event.hashNumber == birthdayController.hashCode) {
  //     birthdayController.text = event.newValue;
  //   }
  // }

  AccountState _toggleRegistration() {
    if (state is AuthInitialState) {
      if ((state as AuthInitialState).accountState == AccountState.register) {
        return AccountState.login;
      } else {
        return AccountState.register;
      }
    } else {
      return AccountState.login;
    }
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    try {
      return AuthInitialState.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    try {
      return (state as AuthInitialState).toJson();
    } catch (_) {
      return null;
    }
  }
}
