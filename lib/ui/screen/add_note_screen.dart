import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/data/controller/sharedpref_controller.dart';
import 'package:note_app/data/models/note_model.dart';
import 'package:note_app/data/controller/note_controller.dart';
import 'package:note_app/ui/screen/home_screen.dart';
import 'package:note_app/ui/screen/main_nav_holder_screen.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  // static List<NoteModel> noteList=[];

  final _tittleTEController = TextEditingController();
  final _bodyTEController = TextEditingController();

  bool isSaved = false;

  bool _isAdded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEF6F2),

      appBar: AppBar(
        title: Text("New Note"),
        backgroundColor: Color(0xFFFEF6F2),

        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSaved = !isSaved;
              });
            },
            icon:
                isSaved == false
                    ? Image.asset(
                      "assets/images/bookmark.png",
                      height: 25,
                      width: 25,
                    )
                    : Icon(Icons.save),
          ),

          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: _tittleTEController,
              maxLines: 2,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),

              decoration: InputDecoration(
                hintText: "Title here",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),

                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: TextField(
                maxLines: null,
                expands: true,
                controller: _bodyTEController,
                keyboardType: TextInputType.multiline,
                textAlignVertical: TextAlignVertical.top,

                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(12),

                  hintText: "Notes here",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Visibility(
              visible: _isAdded==false,
              replacement: CircularProgressIndicator(),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _addNote,
                  child: Text(
                    "Save Note",
                    style: TextTheme.of(
                      context,
                    ).titleSmall!.copyWith(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF268F8F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addNote() async {

     setState(() {
       _isAdded=true;
     });


    String title = _tittleTEController.text;
    String body = _bodyTEController.text;

    if (title.isNotEmpty && body.isNotEmpty) {
      // takes the current date
      DateTime now = DateTime.now();
      String formatted = DateFormat("MMMM d").format(now);
      print(formatted);



      NoteModel note = NoteModel(
        title: title,
        body: body,
        date: formatted,
        isSaved: isSaved,
      );

     await   NoteController.addNotes(note);


/// if successfully added perform this section

      if(!mounted){

        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Note Added Successfully"),
          backgroundColor: Colors.green,
        ),
      );


      setState(() {

        isSaved=false;
        _isAdded=false;

      });


      _bodyTEController.clear();
      _tittleTEController.clear();





    } else {

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Title and body cant be empty"),
      backgroundColor: Colors.red,));

    }
  }
}
