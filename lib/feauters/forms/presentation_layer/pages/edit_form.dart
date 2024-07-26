import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/constantsColor.dart';
import '../../../../core/constants/constantsStringApp.dart';
import '../../../../core/constants/contantsVarApp.dart';
import '../../../../core/widgetsApp/TextFiledCustom.dart';
import '../../../../core/widgetsApp/widget_button.dart';
import '../../data_layer/models/form.dart';
import '../provider/form.dart';
import '../widgets/drop_down.dart';

// ignore: must_be_immutable
class EditForm extends StatelessWidget {
  TextEditingController nameFormController = TextEditingController();
  TextEditingController questionFormController = TextEditingController();
  TextEditingController questionFormTwoController = TextEditingController();
  TextEditingController typeFormController = TextEditingController();
  TextEditingController spiecialTypeFormController = TextEditingController();
  ValueNotifier<Widget> valueNotifierWidget = ValueNotifier(const SizedBox());
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    nameFor = editForm.nameForm;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: white,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () { Navigator.pop(context); },
                      icon: const Icon(Icons.arrow_back_rounded,color: yellow, size: 30,)
                    )
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(editFormS,style: TextStyle(color: black,fontSize: 30, fontFamily: "Josefin Sans",shadows: [BoxShadow(color: black, offset: Offset(1, 1),spreadRadius: 0.01,blurRadius: 1.0,) ])),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text(nameFormS),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: TextFiledCustom( yellow.withOpacity(0.06), 1,nameFormController,"${editForm.nameForm}",TextInputType.name),
                        )
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text(typeFormS,),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: DropDown("${editForm.type}", typeFormController, typeList)
                        )
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text(spiecalTypeS ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: ValueListenableBuilder(
                            valueListenable: valueNotifierr,
                            builder: (context, value, child) {
                              return DropDown("${editForm.specialType}",spiecialTypeFormController, value);
                            },
                          )
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text( questionS,),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: TextFiledCustom( yellow.withOpacity(0.06),1,questionFormController, "${editForm.questions[0]}", TextInputType.name),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 100),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text(questionS, ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: TextFiledCustom(yellow.withOpacity(0.06),1, questionFormTwoController, "${editForm.questions[1]}", TextInputType.name),)
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Consumer(
                    builder: (context, ref, child) {
                      return ButtonCustom( 150,50, ref.watch(forms).when(
                              data: (_) => const Text(edit,style: TextStyle( fontFamily: "Josefin Sans",fontSize: 25,color: black),),
                              error: (error, _) => Text('Error: $error',style: const TextStyle(fontFamily: "Josefin Sans",fontSize: 30,color: black)),
                              loading: () => const CupertinoActivityIndicator(color: black, )),
                          yellow, white, () async {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }
                        formKey.currentState!.save();
                        FormsModel user = FormsModel( nameForm: nameFormController.text, questions: [ questionFormController.text, questionFormTwoController.text ],  type: typeFormController.text, specialType: spiecialTypeFormController.text);
                        ref.read(forms.notifier).editForm(user).then((value) { Navigator.pop(context);});
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

ValueNotifier<List> valueNotifierr = ValueNotifier([]);
