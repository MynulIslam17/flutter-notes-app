import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/data/controller/sharedpref_controller.dart';
import 'package:note_app/data/models/note_model.dart';
import 'package:note_app/data/controller/note_controller.dart';
import 'package:note_app/ui/screen/add_note_screen.dart';

class NoteCard extends StatefulWidget {

  final String text;
  final List<NoteModel> noteList;

  const NoteCard({super.key,
  required this.noteList,
    required this.text
  });

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {

  @override
  Widget build(BuildContext context) {
    return widget.noteList.isNotEmpty
        ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 3,
              mainAxisSpacing: 6,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              NoteModel note =
                  widget.noteList[widget.noteList.length -
                      1 -
                      index]; // reverse
              return Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                clipBehavior: Clip.antiAlias,

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///save icon
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () async{





                          },
                          icon:
                              note.isSaved == true
                                  ? Image.asset(
                                    "assets/images/saved.png",
                                    color: Colors.red,
                                    height: 23,
                                    width: 23,
                                  )
                                  : Image.asset(
                                    "assets/images/bookmark.png",
                                    color: Colors.red,
                                    height: 23,
                                    width: 23,
                                  ),
                        ),
                      ),

                      Text(
                        note.title,
                        style: TextTheme.of(context).titleMedium!.copyWith(
                          color: Color(0xFF0C9797).withOpacity(0.9),
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 2,
                      ),

                      Text(
                        note.body,
                        style: TextTheme.of(context).titleSmall!.copyWith(
                          color: Colors.black,
                          fontSize: 11,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 5,
                      ),

                      Spacer(),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(

                            note.date,
                            style: TextStyle(

                              fontSize: 9,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },

            itemCount: widget.noteList.length,
          ),
        )
        : Center(
          child: Text(
            widget.text,
            style: TextTheme.of(
              context,
            ).titleSmall!.copyWith(color: Color(0xFF268F8F)),
          ),
        );
  }
}
