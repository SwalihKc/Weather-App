import 'package:flutter/material.dart';
 
class customeText extends StatelessWidget {
  String text;
  double size;
  FontWeight weight;
   customeText({super.key,required this.text,required this.size,required this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",style:TextStyle(fontSize: size,fontWeight: weight,color: Theme.of(context).textTheme.bodyLarge!.color) ,
    );
  }
}