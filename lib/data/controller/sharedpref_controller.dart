
  import 'dart:convert';

import 'package:note_app/data/models/note_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController{

  static  const  String KeyNotes= "notes"; // use as key

  static List<NoteModel>   savedNotes=[];


 /// for saving list of notes
   static Future<void> saveData(List<NoteModel> noteModel) async{
      final SharedPreferences sharedPref= await SharedPreferences.getInstance();

        List<String> jsonList  = noteModel.map((note)=>jsonEncode(note.toMap())).toList();

      await sharedPref.setStringList(KeyNotes, jsonList);


    }

/// get the list of notes


   static Future<List<NoteModel>> loadNotes() async{

     final SharedPreferences sharedPref=await SharedPreferences.getInstance();

     List<String> ? jsonList= sharedPref.getStringList(KeyNotes);
     
     if(jsonList!=null){

       savedNotes= jsonList.map((jsonString)=>NoteModel.fromJson(jsonDecode(jsonString))).toList();

     }else{
       savedNotes=[];;
     }


      return savedNotes;

   }


   static Future<bool> clearData() async{
     final SharedPreferences sharedPref= await SharedPreferences.getInstance();
   bool success= await sharedPref.clear();
   await loadNotes();

  // savedNotes.clear();

    return success;
   }



  }