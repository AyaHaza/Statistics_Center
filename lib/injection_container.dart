import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '/featurs/authentication/data_layer/data_sources/remote/auth_api_service.dart';
import '/featurs/authentication/data_layer/data_sources/remote/auth_api_service_imp.dart';
import '/featurs/authentication/data_layer/repository/authentication_repository_imp.dart';
import '/featurs/authentication/domain_layer/repository/authentication_repository.dart';
import '/featurs/authentication/domain_layer/usecases/signup_usecase.dart';
import '/featurs/forms/data_layer/data_source/remote/form_service.dart';
import '/featurs/forms/data_layer/data_source/remote/form_srevice_imp.dart';
import '/featurs/forms/data_layer/repository/form_repository_imp.dart';
import '/featurs/forms/domain_layer/repository/form_repository.dart';
import '/featurs/forms/domain_layer/usecases/getForms.dart';
import '/featurs/forms/domain_layer/usecases/getQuestions.dart';

final sl=GetIt.instance;

Future <void> initializeDependencies()async{
  sl.registerSingleton<Dio>(Dio());

  //Authentication
  sl.registerSingleton<AuthApiService>(AuthApiServiceImp());
  sl.registerSingleton<AuthenticationRepository>(AuthenticationRepositoryImp(sl()));
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase(sl()));

  //Form
  sl.registerSingleton<FormApiService>(FormApiServiceImp());
  sl.registerSingleton<FormRepository>(FormRepositoryImp(sl()));
  sl.registerSingleton<GetAllFormsUseCase>(GetAllFormsUseCase(sl()));
  sl.registerSingleton<GetQuestionFormsUseCase>(GetQuestionFormsUseCase(sl()));

}