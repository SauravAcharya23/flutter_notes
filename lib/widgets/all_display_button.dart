
import 'package:flutter/material.dart';

Widget allText(){
  return Container(
    alignment: AlignmentDirectional.bottomStart,
    margin: const EdgeInsets.only(top: 10, bottom: 10),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0)),
        padding: const EdgeInsets.symmetric(vertical: 14),
        backgroundColor: Colors.grey.shade300
      ),
      onPressed: (){}, 
      child: const Text(
        'All', 
        style: TextStyle(
          fontSize: 16, 
          fontWeight: FontWeight.w500,
          color: Colors.black
        ),
      ),
    ), 
  ); 
}