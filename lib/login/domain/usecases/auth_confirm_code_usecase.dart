

import '../../../core/data_state/data_state.dart';
import '../../../core/usecase/usecase_core.dart';
import '../entities/auth_login_entity.dart';
import '../repositories/auth_repository.dart';

class AuthConfirmCodeUsecase extends UsecaseCore<DataState<AuthLoginEntity>, Map<String,String>> {
  final AuthRepository _authRepository;

  AuthConfirmCodeUsecase(this._authRepository);

  @override
  Future<DataState<AuthLoginEntity>> call({Map<String,String>? param}) {
    return _authRepository.confirmCode(phoneNumber: param!['PhoneNumber']!,code: param['Code']!);
  }
}
