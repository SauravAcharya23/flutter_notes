
import 'package:hive/hive.dart';
import 'package:notes/model/notes.dart';

class Boxes{

  static Box<NotesModel> getData() => Hive.box('notes'); 
}