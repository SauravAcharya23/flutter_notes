
import 'package:flutter/material.dart';

AppBar appbar(){
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.grey.shade100,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        const Icon(Icons.menu, color: Colors.black, size: 30,),
        SizedBox(
          height: 40,
          width: 40,
          child: ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.asset('assets/images/man.jpg')),//CircleAvatar(backgroundImage: AssetImage('assets/images/man.jpg'),)
        )
      ],
    ), 
  );
}