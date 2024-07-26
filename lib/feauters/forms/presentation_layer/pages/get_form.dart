import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/constantsColor.dart';
import '../../../../core/constants/constantsStringApp.dart';
import '../../../../core/constants/contantsVarApp.dart';
import '../provider/form.dart';

// ignore: use_key_in_widget_constructors
class GetForms extends ConsumerWidget {
  @override
  Widget build(BuildContext context,ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: yellow,
        onPressed: (){ Navigator.pushNamed(context, '/AddForm'); },
        child:const Icon(Icons.add_outlined,color: white,),
        ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: white,
        child: Column(
          children: [
            const SizedBox(height: 50,),
            Row(
              children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 10.0),
                   child: IconButton(onPressed: (){
                    ref.invalidate(getData);
                    ref.read(forms.notifier);
                    }, 
                    icon: const Icon(Icons.refresh)),
                 ),

                const Text(allForms,style: TextStyle(color: black,fontSize: 30,fontFamily:"Josefin Sans",fontWeight: FontWeight.bold,shadows: [
                      BoxShadow(
                        color: black,
                        offset: Offset(1,1),
                        spreadRadius: 0.01,
                        blurRadius:1.0,
                      )
                    ] ),),
              ],
            ),
            const SizedBox(height: 8,),
            Text(editFormString,style: TextStyle(color: black.withOpacity(0.4),fontSize: 16,fontFamily:"Josefin Sans",)),
            const SizedBox(height: 20,),
            Expanded(
              child: ref.watch(getData).when(
               data:(data){
                 return  ListView.builder(
                 itemCount: data.length,
                 itemBuilder: (context, index) {
                   return Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(left: 4.0),
                         child: ListTile(
                           title:Expanded(child: Text("${data[index].nameForm}",style:const TextStyle(color: black,fontFamily:"Josefin Sans", fontSize: 22, fontWeight: FontWeight.bold, ),)) ,
                           subtitle: Text("$type : ${data[index].type}  |  $speicalType : ${data[index].specialType}",style: TextStyle(color: black.withOpacity(0.4),fontFamily:"Josefin Sans" ),),
                           trailing: SizedBox(
                            width: 74,
                             child: Row(
                               children: [
                                 IconButton(
                                  icon:const Icon(Icons.edit,color: green,),
                                  onPressed: () async{
                                   editForm=data[index];
                                   Navigator.pushNamed(context, '/EditForm');
                                  },
                                ),
                                const Icon(Icons.delete,color: red,)
                               ],
                             ),
                           ),
                         ),
                       ),
                       const Align(alignment: Alignment.center,child: Divider(color: yellow,indent: 50,endIndent: 60,thickness: 1,)),
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
                   child: CupertinoActivityIndicator(color: black,),
                 );
               },
              ),
            )
          ],
        ),
      ),
    );
  }
}