import '../../../../core/usecases/usecases.dart';
import '../repository/form.dart';

class AddFormUseeCase extends UseCse{
  FormRepository formRepository;
  AddFormUseeCase(this.formRepository);

  @override
  Future <bool> call(params)async {
    return await formRepository.addForm(params);
  }
  
}