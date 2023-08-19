

import '../../../core/data_state/data_state.dart';
import '../../../core/usecase/usecase_core.dart';
import '../repositories/auth_repository.dart';

/// each task or work we want to do we use through it's usecase, any action has it's own usecase,
/// through usecase we access repository and the result will be passed to bloc for ui to use

class AuthSendCodeUsecase extends UsecaseCore<DataState<bool>, String> {
  final AuthRepository _authRepository;

  AuthSendCodeUsecase(this._authRepository);

  @override
  Future<DataState<bool>> call({String? param}) {
    return _authRepository.sendCodeRegister(phoneNumber: param!);
  }
}
