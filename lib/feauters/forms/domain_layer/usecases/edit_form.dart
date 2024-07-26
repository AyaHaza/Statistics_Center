import '../../../../core/usecases/usecases.dart';
import '../repository/form.dart';

class EditFormUseeCase extends UseCse{
  FormRepository formRepository;
  EditFormUseeCase(this.formRepository);

  @override
  Future <bool> call(params)async {
    return await formRepository.editForm(params);
  }
  
}