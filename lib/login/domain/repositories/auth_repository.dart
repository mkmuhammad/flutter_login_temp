
import '../../../core/data_state/data_state.dart';
import '../entities/auth_login_entity.dart';

/// this layer is for hiding impl from domain layer,
/// usecases can only access repository methods and not implementations,
/// we expose them for usecase abstractly
abstract class AuthRepository{

  Future<DataState<bool>> sendCodeRegister({required String phoneNumber});

  Future<DataState<AuthLoginEntity>> confirmCode({required String phoneNumber,required String code});

}