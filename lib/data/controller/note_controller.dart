
  import 'package:note_app/data/controller/sharedpref_controller.dart';
import 'package:note_app/data/models/note_model.dart';

class NoteController {

///add notes
 static Future<void> addNotes(NoteModel note) async{

       List<NoteModel> currentNoteList=await SharedPrefController.loadNotes();
       currentNoteList.add(note);

      await SharedPrefController.saveData(currentNoteList);

 }


 static Future<void> getData() async{

   await SharedPrefController.loadNotes();

 }

 /// get note list

 static List<NoteModel> get noteList =>SharedPrefController.savedNotes;


 static Future<bool> clearData()async{

  bool success= await SharedPrefController.clearData();

   return success;
 }













  }