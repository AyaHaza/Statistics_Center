import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../injection_container.dart';
import '../../domain_layer/entities/form.dart';
import '../../domain_layer/usecases/add_form.dart';
import '../../domain_layer/usecases/edit_form.dart';
import '../../domain_layer/usecases/get_forms.dart';

final getData = StreamProvider.autoDispose<List<FormsEntity>>((ref) {
   ref.read(forms.notifier).getForm();
   return ref.watch(forms.notifier).getForm();
});

final forms=StateNotifierProvider.autoDispose<formsNotifier,AsyncValue<bool>>((ref){
  return formsNotifier(sl(),sl(),sl());
});

class formsNotifier extends StateNotifier<AsyncValue<bool>>{
  final GetFormsUseCase getFormsUseCase;
  final AddFormUseeCase addFormUseeCase; 
  final EditFormUseeCase editFormUseeCase;
  formsNotifier(this.getFormsUseCase,this.addFormUseeCase,this.editFormUseeCase) : super(AsyncValue.data(false));

  Stream<List<FormsEntity>> getForm(){
    var res= getFormsUseCase.call("get");
    return res;
  }

  Future<bool> addForm(formEntity)async{
    state=const AsyncValue.loading();
    var res=await addFormUseeCase.call(formEntity);
      state=const AsyncValue.data(false);
    return res;
  }

  Future<bool> editForm(formEntity)async{
    state=const AsyncValue.loading();
    var res=await editFormUseeCase.call(formEntity);
      state=const AsyncValue.data(false);
    return res;
  }
}

