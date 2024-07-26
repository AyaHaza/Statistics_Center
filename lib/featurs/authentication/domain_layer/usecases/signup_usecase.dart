import '../../../../core/usecases/usecases.dart';
import '../entities/user_entity.dart';
import '../repository/authentication_repository.dart';

class SignUpUseCase extends UseCse<bool,UserEntity> {
  AuthenticationRepository authenticationPepositpory;
  SignUpUseCase(
     this.authenticationPepositpory,
  );

  Future<bool> call(userEntity) async {
    return await authenticationPepositpory.signUp(userEntity);
  }
}