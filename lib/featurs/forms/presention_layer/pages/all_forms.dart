import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/constantsColor.dart';
import '../../../../core/constants/constantsStringApp.dart';
import '../../../../core/constants/contantsVarApp.dart';
import '../provider/form.dart';

class AllForms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    count = 0;
    return Scaffold(
      body: Container(
      width: double.infinity,
      height: double.infinity,
      color: white,
      child: Column(
        children: [
          const SizedBox( height: 60,),
          const Text(formsSuitable,style: TextStyle( color: black,fontSize: 30,fontFamily: "Josefin Sans",fontWeight: FontWeight.bold,shadows: [BoxShadow( color: black,offset: Offset(1, 1),spreadRadius: 0.01,blurRadius: 1.0,) ]),),
          const SizedBox(height: 10, ),
          Text(chooseOne, style: TextStyle(color: black.withOpacity(0.6),fontSize: 16,fontFamily: "Josefin Sans",)),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 20),
              child: Consumer(
                builder: (context, ref, _) {
                  return ref.watch(getData).when(
                    data: (data) {
                      return ListView.builder(
                        itemCount: data[0].usesAndForms.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                child: ListTile(
                                  title: Row(
                                    children: [
                                      const Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: Icon( Icons.animation_rounded,color: yellow, ),
                                      ),
                                      Expanded(
                                        child: Text(
                                        "${data[0].usesAndForms[index].forms.nameForm}",
                                        style: const TextStyle(
                                          color: black,
                                          fontFamily: "Josefin Sans",
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                    ],
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.arrow_circle_right,color: yellow,size: 30, ),
                                    onPressed: () async {
                                      nameForm = data[0].usesAndForms[index].forms.nameForm;
                                      print(nameForm);
                                      Navigator.pushNamed( context, '/Questions');
                                    },
                                  ),
                                ),
                              ),
                              const Align(
                                alignment: Alignment.center,
                                child: Divider(color: yellow,indent: 50, endIndent: 60,thickness: 1,)
                              ),
                            ],
                          );
                        },
                      );
                    },
                    error: (error, stackTrace) {
                      return const Text(errorS);
                    },
                    loading: () {
                      return const Center(
                        child: CupertinoActivityIndicator(
                          color: black,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
         ],
        )
      ),
    );
  }
}
