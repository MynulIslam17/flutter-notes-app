import 'package:flutter/material.dart';
import 'package:note_app/data/controller/note_controller.dart';
import 'package:note_app/data/models/note_model.dart';
import 'package:note_app/ui/widget/note_card.dart';
import '../widget/category_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NoteModel> _recentNoteList=[];
   List<NoteModel>_bookmarkedList=[];


    void _getRecentNotes(){

      List<NoteModel>newList=[];
     for(final note in NoteController.noteList){

       if(!note.isSaved){
         newList.add(note);
       }

     }

     setState(() {
       _recentNoteList=newList;

     });



    }

    void _getBookmarkedNotes(){

      List<NoteModel>newList=[];
     for(final note in NoteController.noteList){

       if(note.isSaved){
         newList.add(note);
       }

     }

     setState(() {
     _bookmarkedList  =newList;

     });



    }



    @override
  void initState() {
    // TODO: implement initState
      _getRecentNotes();
      _getBookmarkedNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFFEF6F2),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF0C9999),
                          ),
                          children: [
                            TextSpan(text: "Welcome to your\n"),
                            TextSpan(
                              text: "Notebook",
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Material(
                          color: Colors.white,
                          child: InkWell(
                            splashColor: Colors.red.withOpacity(0.3),
                            onTap: () {

                            },
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Search notes",
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Icon(Icons.search, color: Colors.red),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GridView.count(
                        crossAxisCount: 3,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        mainAxisSpacing: 20,
                        children: const [
                          CategoryCard(title: "Personal", notesCount: 10, color: Color(0xFF0B9A9A)),
                          CategoryCard(title: "Work", notesCount: 20, color: Colors.blue),
                          CategoryCard(title: "To-Do", notesCount: 33, color: Color(0xFFFB7A68)),
                        ],
                      ),

                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _TabBarDelegate(
                  const TabBar(
                    dividerColor: Colors.transparent,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.transparent,
                    tabs: [
                      Tab(text: "Recent"),
                      Tab(text: "BookMarked"),
                      Tab(text: "Shared"),
                    ],
                  ),
                ),
              ),
            ];
          },
          body:  TabBarView(
            children: [
              NoteCard(
                text: "No recent notes yet",
                noteList: _recentNoteList,

              ),

            NoteCard(
                text: "No bookmarked notes yet",
                noteList: _bookmarkedList,

              ),




              Center(child: Text("Shared2")),
            ],
          ),
        ),
      ),
    );
  }
}

/// Sticky TabBar Helper
class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  _TabBarDelegate(this.tabBar);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white, // TabBar background
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;
  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  bool shouldRebuild(_TabBarDelegate oldDelegate) => false;
}
