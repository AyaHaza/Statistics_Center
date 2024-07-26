import '../../domain_layer/entities/all_forms_entity.dart';
import '../../domain_layer/entities/question_entity.dart';
import '../../domain_layer/repository/form_repository.dart';
import '../data_source/remote/form_service.dart';

class FormRepositoryImp implements FormRepository{
  final FormApiService formApiService;
  FormRepositoryImp(this.formApiService);
  @override
  Future<List<AllFormsEntity>> getAllForms() async {
    try{
     final res= await formApiService.getAllFormsApi();
      return res;
    }catch(e){
      print(e);
      return [];
    }
  }

  @override
  Future<List<QestionsEntity>> getQestionsForms(nameForm) async{
    try{
      print("three");
      final res= await formApiService.getQestionsFormsApi(nameForm);
      return res;

    }catch(e){
      return [];

    }
  }
}