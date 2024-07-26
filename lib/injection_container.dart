import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'feauters/forms/data_layer/data_source/remote/form_api_service.dart';
import 'feauters/forms/data_layer/data_source/remote/form_api_service_imp.dart';
import 'feauters/forms/data_layer/repository/form.dart';
import 'feauters/forms/domain_layer/repository/form.dart';
import 'feauters/forms/domain_layer/usecases/add_form.dart';
import 'feauters/forms/domain_layer/usecases/edit_form.dart';
import 'feauters/forms/domain_layer/usecases/get_forms.dart';


final sl=GetIt.instance;

Future <void> initializeDependencies()async{
  
  sl.registerSingleton<Dio>(Dio());

  //Form
  sl.registerSingleton<FormApiService>(FormApiServiceImp());
  sl.registerSingleton<FormRepository>(FormRepositoryImp(sl()));
  sl.registerSingleton<GetFormsUseCase>(GetFormsUseCase(sl()));
  sl.registerSingleton<AddFormUseeCase>(AddFormUseeCase(sl()));
  sl.registerSingleton<EditFormUseeCase>(EditFormUseeCase(sl()));

}