import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/constantsColor.dart';
import '../../../../core/constants/constantsStringApp.dart';
import '../../../../core/constants/contantsVarApp.dart';
import '../../../../core/widgetsApp/widget_button.dart';
import '../../data_layer/models/form.dart';
import '../provider/form.dart';
import '../provider/list_tquestion_riverpod.dart';
import '../widgets/filed.dart';

ValueNotifier<List> valueNotifier = ValueNotifier([]);

// ignore: must_be_immutable
class AddForm extends ConsumerWidget {
  TextEditingController nameFormController = TextEditingController();
  TextEditingController questionFormController = TextEditingController();
  TextEditingController questionTwoFormController = TextEditingController();
  TextEditingController typeFormController = TextEditingController();
  TextEditingController spiecialTypeFormController = TextEditingController();
  ValueNotifier<dynamic> valueNotifierWidget = ValueNotifier(const SizedBox());
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context, ref) {
    final listReadRiverpod = ref.read(ListquestionProvider);
    // ignore: unused_local_variable
    final listWatchRiverpod = ref.watch(ListquestionProvider);
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
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/GetForms');
                        },
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          color: yellow,
                          size: 30,
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: yellowLight,
                            builder: (context) {
                              return SizedBox(
                                height: 200,
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 20),
                                    const Text(addQuestion, style: TextStyle(fontSize: 20),),
                                    Field(questionS, questionFormController,TextInputType.name),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              elevation: 4.4,
                                              backgroundColor: white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            onPressed: () {
                                              listReadRiverpod.add(questionFormController.text);
                                              ref.watch(ListquestionProvider.notifier).state = [...listReadRiverpod];
                                              questionFormController.clear();
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text(add, style: TextStyle(color: green))
                                          ),
                                          const SizedBox( width: 20, ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 10.0),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                elevation: 4.4,
                                                backgroundColor: white,
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular( 10))
                                              ),
                                              onPressed: () {
                                                questionFormController.clear();
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text( cancel, style: TextStyle(color: red))
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          color: yellowLight,
                          child: const Text(addQuestion),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10,),
                const Align(
                  alignment: Alignment.center,
                  child: Text(addFormS,style: TextStyle(color: black, fontSize: 30, fontFamily: "Josefin Sans",fontWeight: FontWeight.bold,shadows: [BoxShadow(color: black,offset: Offset(1, 1),spreadRadius: 0.01, blurRadius: 1.0, ) ])),
                ),
                const SizedBox(height: 30,),
                Field(nameFormS, nameFormController, TextInputType.name),
                FieldWithDropDown(typeFormS, typeFormController, typeList),
                ValueListenableBuilder(
                  valueListenable: valueNotifier,
                  builder: (context, value, child) => FieldWithDropDown(
                      spiecalTypeS, spiecialTypeFormController, value),
                ),
                Field(questionS, questionFormController, TextInputType.name),
                Field(questionS, questionTwoFormController, TextInputType.name),
                SizedBox(height: 120,),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Consumer(
                    builder: (context, ref, child) {
                      return ButtonCustom(150,50,ref.watch(forms).when(
                              data: (_) => const Text(add,style: TextStyle(fontFamily: "Josefin Sans",fontSize: 25,color: black),),
                              error: (error, _) => Text('Error: $error',style: const TextStyle(fontFamily: "Josefin Sans",fontSize: 30,color: black)),
                              loading: () => const CupertinoActivityIndicator(color: black, )),
                          yellow, white, () async {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }
                        formKey.currentState!.save();
            
                        FormsModel user = FormsModel(nameForm: nameFormController.text,questions: [questionFormController.text,questionTwoFormController.text],type: typeFormController.text,specialType: spiecialTypeFormController.text);
                        print(user.questions);
                        ref.read(forms.notifier).addForm(user).then((value) {
                          Navigator.pushNamedAndRemoveUntil(context, '/GetForms', ModalRoute.withName('/GetForms'));
                        });
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
