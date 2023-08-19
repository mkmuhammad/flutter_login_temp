import 'package:dio/dio.dart';

import '../../../core/data_state/data_state.dart';
import '../../domain/entities/auth_login_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_datasources.dart';
import '../models/auth_login_model.dart';

/// repository impl is responsible for accessing datasource(local/remote) and provide data for UI(through usecase actually)
/// and change raw data comes form datasource the way needed
///
/// (actually it provides for ui elements through usecases and blocs can use through bloc states)
///
/// data comes in model form and converts to entity and in our usecases can use repositories methods

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepositoryImpl(this._authDataSource);

  @override
  Future<DataState<bool>> sendCodeRegister({required String phoneNumber}) async {
    try {
      Response response = await _authDataSource.postPhoneNumber(phoneNumber: phoneNumber);
      if (response.data == true || response.data == 'true') {
        return DataSuccess(true);
      } else {
        return DataSuccess(false);
      }
    } catch (e) {
      return DataError(e.toString());
    }
  }

  @override
  Future<DataState<AuthLoginEntity>> confirmCode({required String phoneNumber, required String code}) async {
    try {
      Response response = await _authDataSource.postConfirmationCode(phoneNumber: phoneNumber, code: code);
      if (response.statusCode == 200) {
        AuthLoginEntity loginEntity = AuthLoginModel.fromJson((response.data as Map<String, dynamic>));
        return DataSuccess(loginEntity);
      } else {
        return DataError('error');
      }
    } on DioException catch (de) {
      if (de.response?.statusCode == 401) {
        return DataSuccess(AuthLoginEntity(errorMsg: de.response?.data['Message'] ?? 'error'));
      }else {
        return DataError(de.response?.data['Message'] ?? 'error');
      }
    } catch (e) {
      return DataError(e.toString());
    }
  }
}
