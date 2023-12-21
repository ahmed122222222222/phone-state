import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silent/core/styels.dart';
import 'package:silent/features/loginscreen/data/repoimp.dart';
import 'package:silent/features/loginscreen/presention/view/widget/vaildation.dart';

import '../../../../homepage/presention/view/widget/buttonbackground.dart';
import '../../manager/cubit/singup_cubit.dart';
import 'customtextformfiled.dart';

// ignore: must_be_immutable
class Singupbody extends StatelessWidget {
Singuprepoimp singuprepoimp=Singuprepoimp();
// ignore: prefer_typing_uninitialized_variables
var  email,pass;
GlobalKey <FormState>globalKey =GlobalKey();

  Singupbody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 35, right: 36, top: MediaQuery.of(context).size.height *.03 ),
      child: BlocListener<SingupCubit, SingupState>(
        listener: (context, state) {
     
        },
        child: Form(
          key: globalKey,
          child: ListView(
            children: [
              Row(
                children: [
                  Text(
                    "انشاء حساب في ",
                    style: styels.font40.copyWith(
                        fontWeight: FontWeight.w800,
                        fontFamily: "irish",
                        fontSize: 32),
                  ),
                  Image.asset("asset/image/لولو.png"),
                ],
              ),
              Textformfiledyou(str1: 'الاسم', str2: "احمد", onSaved: (v ) {  },),
              Textformfiledyou(
                  str1: 'البريد الالكتروني', str2: "ahmedosama@gmail.com", onSaved: (v ) { email=v; },),
              Textformfiledyou(str1: "كلمه السر", str2: "************", onSaved: (v ) {  },),
              Textformfiledyou(str1: "تاكيد كلمه السر ", str2: "**********", onSaved: (v ) { pass=v; },),
              custombutton(onPressed: () {
        
                try {
                 if ( globalKey.currentState!.validate()) {
 
            try {
  BlocProvider.of<SingupCubit>(context).Singup(email, pass);
  Navigator.push(context, MaterialPageRoute(builder: (builder)=>const Vaildation()));
  
} on Exception catch (e) {
final snackBar =
                          SnackBar(content: Text(e.toString(),style: styels.font12,),backgroundColor: const Color(0xFF3B26B8),);
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
                   
}
       else {
                      const snackBar =
                          SnackBar(content: Text('الرجاء إدخال البريد الإلكتروني وكلمة المرور.',style: styels.font12,),backgroundColor: Color(0xFF3B26B8),);
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
           
        } on Exception catch (e) {
         final snackBar =
                          SnackBar(content: Text(e.toString(),style: styels.font12,),backgroundColor: const Color(0xFF3B26B8),);
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
              }
              
              ),
            ],
          ),
        ),
      ),
    );
  }
}
