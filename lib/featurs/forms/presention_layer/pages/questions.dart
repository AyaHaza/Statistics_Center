import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/constantsColor.dart';
import '../../../../core/constants/constantsStringApp.dart';
import '../../../../core/constants/contantsVarApp.dart';
import '../../../../core/service/serviceNtification.dart';
import '../../../../core/widgetsApp/TextFiledCustom.dart';
import '../provider/form.dart';


// ignore: must_be_immutable
class Questions extends StatelessWidget {
  Map<String, TextEditingController> _textControllers = new Map();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color:  white,
        child: Column(
          children: [
            const SizedBox(height: 60,),
             Text("$form $nameForm",style:const TextStyle(color: black,fontSize: 30,fontFamily:"Josefin Sans",fontWeight: FontWeight.bold,shadows: [
                  BoxShadow(
                    color: black,
                    offset: Offset(1,1),
                    spreadRadius: 0.01,
                    blurRadius:1.0,
                  )
                ] ),),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: Text( filledIn,style: TextStyle(color: black.withOpacity(0.6),fontSize: 16,fontFamily:"Josefin Sans",)),
                    ),
                    InkWell(onTap: ()async{if(_textControllers.isNotEmpty){await LocalNotificationService().showNotificationText();}},child: const Text("DONE" ,style: TextStyle(color: yellow,fontSize: 18,fontFamily:"Josefin Sans",decoration: TextDecoration.underline))),
                     Text(" *" ,style: TextStyle(color: black.withOpacity(0.6),fontSize: 16,fontFamily:"Josefin Sans",)),
                    
                  ],  
                ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 0),
                child:  Consumer(
                  builder: (context, ref, _) {
                    return ref.watch(getQuestions).when(
                      data: (data) {
                        return ListView.builder(
                          itemCount: data[0].questions.length,
                          itemBuilder: (context, index) {
                            data[0].questions.forEach((controller) => _textControllers[controller] = new TextEditingController());
                            return Flexible(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02,right:  MediaQuery.of(context).size.width*0.02,bottom:  MediaQuery.of(context).size.width*0.01),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // color: pink,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 18.0,left: 10,bottom: 10),
                                      child: Row(
                                        children: [
                                          const Padding(
                                            padding: const EdgeInsets.only(right: 8.0),
                                            child: Icon(Icons.animation_rounded,color: yellow,),
                                          ),
                                          Expanded(
                                            child:  Text(data[0].questions[index],style: const TextStyle(color: black,fontFamily:"Josefin Sans", fontSize: 22, fontWeight: FontWeight.bold ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                      child: TextFiledCustom( yellow.withOpacity(0.07), 1, _textControllers[data[0].questions[index]]!,Icon(Icons.draw_outlined),"",TextInputType.name,false),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      error: (error, stackTrace) {
                        return const Text(errorS);
                      },
                      loading: () {
                        return const Center(
                          child: CupertinoActivityIndicator(color: black,),
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




