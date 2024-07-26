import '../../../../../core/service/coreService.dart';

abstract class AuthApiService extends CoreService {
  Future<bool> signUp(userEntity);
}