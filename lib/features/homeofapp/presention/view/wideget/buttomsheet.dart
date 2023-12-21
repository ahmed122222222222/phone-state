import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:silent/core/styels.dart';

class custombutoomsheet extends StatelessWidget {
  const custombutoomsheet({super.key, required this.str1, required this.str2});
   final String str1,str2;
   @override
  Widget build(BuildContext context) {
 return  Stack(
        children: [
          // الخلفية الزرقاء مع النص الأول والأيقونة
          Container(
            color: Color.fromARGB(255, 161, 135, 235),
            child: Center(
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                   
                    children: [
                     IconButton(onPressed: (){}, icon: Image.asset("asset/image/charm_menu-kebab.png",color: Colors.white,)),
                     IconButton(onPressed: (){}, icon: const Icon(Icons.edit,color: Colors.white,)),
                     IconButton(onPressed: (){}, icon:const Icon (Icons.star_rate,color: Colors.white,))
                    ],
                  ),
                  Center(child: Icon(Icons.person, size: 200, color: Colors.white.withOpacity(.3))), // الأيقونة
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(str2,style: styels.font20.copyWith(color: Colors.black87),),
                  )
                 
                ],
              ),
            ),
          ),
          // الخلفية البيضاء مع الكارد
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListTile(
                  leading: Icon(Icons.phone),
                  title:Text(str1) ,
                  subtitle:Text("mobile") ,
                  trailing: Icon(Icons.messenger_outlined),


                )
              ),
            ),
          ),
        ],
      );
  }
}
