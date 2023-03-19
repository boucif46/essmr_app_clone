import 'package:essamar/utils/colors.dart';
import 'package:essamar/utils/layout.dart';
import 'package:flutter/material.dart';


class FisrtPage extends StatelessWidget {
  const FisrtPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
         child: Center(
           child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                 SizedBox(
                  width: Layout.width(context,250),
                  height: Layout.height(context,200),
                  child: const Image(image: AssetImage("images/logo.png"),fit:BoxFit.fill,),
                ),
                Container(
                  width: Layout.width(context, 160),
                  height: Layout.height(context,40),
                  padding:const  EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Layout.radius(context, 20)),
                    color: AppColors.mainColor
                  ),
                  child: Center(child:Text("اللغةالعربية",style: TextStyle(color: Colors.white,fontSize: Layout.fontSize(context, 16)),)),
                ),
                SizedBox(height: Layout.height(context, 12),),
                Container(
                  width: Layout.width(context,160),
                  height: Layout.height(context,40),
                  padding:const  EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Layout.radius(context, 20)),
                    color: AppColors.mainColor
                  ),
                  child:    Center(child: Text("Francais",style: TextStyle(color: Colors.white,fontSize: Layout.fontSize(context, 16)))),
                ),
              ],
            ),
         ),
       ),
     
    );
  }
}