import '../../domain_layer/entities/form.dart';
import '../../domain_layer/repository/form.dart';
import '../data_source/remote/form_api_service.dart';

class FormRepositoryImp implements FormRepository{
FormApiService formApiService;
FormRepositoryImp(this.formApiService);

  @override
  Stream<List<FormsEntity>> getForms() {
    return formApiService.getForms();
  }
  
  @override
  Future<bool> addForm(formEntity) async{
    return await formApiService.addForm(formEntity);
  }
  
  @override
  Future<bool> editForm(formEntity)async {
    return await formApiService.editForm(formEntity);
  }
}