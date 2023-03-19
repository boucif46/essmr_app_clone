import 'package:flutter/material.dart';

class Layout {

  static double width(BuildContext context,double width){
     return MediaQuery.of(context).size.width*(width/MediaQuery.of(context).size.width) ;
    
  }

 static double height(BuildContext context,double height){
    return MediaQuery.of(context).size.height*(height/MediaQuery.of(context).size.height) ;
    
  }
 
 static double fontSize(BuildContext context,double fontSize){
  return  MediaQuery.of(context).size.shortestSide*(fontSize/MediaQuery.of(context).size.shortestSide);
 
 }

 static double radius(BuildContext context,double radius){
  
  return MediaQuery.of(context).size.shortestSide*(radius/MediaQuery.of(context).size.shortestSide);
 }

}