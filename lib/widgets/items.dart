import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/Controller/notes_controller.dart';
import 'package:notes/boxes/boxes.dart';
import 'package:notes/model/notes.dart';

class items extends StatefulWidget {
  const items({super.key});

  @override
  State<items> createState() => _itemsState();
}

class _itemsState extends State<items> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Boxes.getData().listenable(), 
      builder: (context, value, child) {
        var data = value.values.toList().cast<NotesModel>();
        return Expanded(
          child: ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  color: Colors.white,
                  child: ListTile(
                    onTap: (){viewNote(data[index].title.toString(), data[index].description.toString());},
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    title: Text(data[index].title.toString(), style: const TextStyle(fontSize: 16, color: Colors.black),),
                    subtitle: SizedBox( height: 16, child: Text(data[index].description.toString())), 
                    leading: InkWell(onTap: (){editDiaglog(data[index],data[index].title.toString(),data[index].description.toString());}, child: Icon(Icons.edit, color: Colors.blue.shade300,)),
                    minLeadingWidth: 5,
                    trailing: InkWell(onTap: (){deleteData(data[index]);}, child: Icon(Icons.delete, color: Colors.red.shade400,)),
                  ),
                ),
              );
            },
          )
        );
        
      },
    );
  }
}