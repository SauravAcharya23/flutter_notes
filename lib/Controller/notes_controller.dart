
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/model/notes.dart';

final titleController = TextEditingController();
final descriptionController = TextEditingController();

void deleteData(NotesModel notesModel)async{
 await notesModel.delete();
}

Future<void> viewNote( String title, String description){
  return Get.defaultDialog(
    title: title,
    middleText: description,
    actions: [
      TextButton(onPressed: (() => Get.back()), child: const Text('OK', style: TextStyle(fontSize: 18),))
    ]
  );
}

Future<void> editDiaglog(NotesModel notesModel, String title, String description){
  titleController.text = title;
  descriptionController.text = description;
  return Get.defaultDialog(
    title: 'Edit Notes',
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
        onPressed: ()async{
          notesModel.title = titleController.text.toString();
          notesModel.description = descriptionController.text.toString();
          await notesModel.save();
          titleController.clear();
          descriptionController.clear();
          Get.back();
        }, 
        child: const Text('Edit', style: TextStyle(fontSize: 18),)
      ),
    ]
  );
}