import '../../domain_layer/repository/authentication_repository.dart';
import '../data_sources/remote/auth_api_service.dart';

class AuthenticationRepositoryImp implements AuthenticationRepository{
 final AuthApiService authApiService;
 AuthenticationRepositoryImp(this.authApiService,);

  @override
  Future<bool> signUp(userEntity) async {
    try{
       await authApiService.signUp(userEntity);
      return true;
    }catch(e){
      print(e);
      return false;
    }
  }
}