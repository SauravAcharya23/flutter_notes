

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/boxes/boxes.dart';
import 'package:notes/model/notes.dart';

final titleController = TextEditingController();
final descriptionController = TextEditingController();
var now = DateTime.now();

FloatingActionButton floatingButton(){
  return FloatingActionButton(
    backgroundColor: Colors.amber.shade700,
    onPressed: (){
      showMyDialog();
    }, 
    child: const Icon(Icons.add,),
  );
} 


Future<void> showMyDialog(){
  return Get.defaultDialog(
    title: 'Add Notes',
    content: SingleChildScrollView(
      child: Column(
        children: [
          TextField(
            controller: titleController,
            maxLength: 25,
            decoration: const InputDecoration(
              hintText: 'Enter title',
              border: OutlineInputBorder()
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          
          SingleChildScrollView(
            child: SizedBox(
              height: 210,
              child: TextField(
                maxLines: null,
                controller: descriptionController,
                //maxLines: 10,
                decoration: const InputDecoration(
                  hintText: 'Enter description',
                  border: OutlineInputBorder()
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    actions: [
      TextButton(onPressed: (){Get.back();}, child: const Text('Cancel', style: TextStyle(fontSize: 18),)),
      TextButton(
        onPressed: (){
          final data = NotesModel(title: titleController.text, description: descriptionController.text,createdOn: now );
          final box = Boxes.getData();
          box.add(data);
          data.save();
          titleController.clear();
          descriptionController.clear();
          Get.back();
        }, 
        child: const Text('Add', style: TextStyle(fontSize: 18),)
      ),
    ]
  );
}