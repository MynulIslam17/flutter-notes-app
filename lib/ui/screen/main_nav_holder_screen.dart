import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/ui/screen/add_note_screen.dart';
import 'package:note_app/ui/screen/profile_screen.dart';
import 'package:note_app/ui/screen/setting_screen.dart';
import 'package:note_app/ui/screen/splash_screen.dart';

import 'home_screen.dart';

class MainNavHolderScreen extends StatefulWidget {
  const MainNavHolderScreen({super.key});

  @override
  State<MainNavHolderScreen> createState() => _MainNavHolderScreenState();
}

class _MainNavHolderScreenState extends State<MainNavHolderScreen> {
  int _selectedIndex = 0;

  final List<Widget> screens = [
   
    const HomeScreen(),
    const ProfileScreen(),
    const AddNoteScreen(),
    const SettingScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Noter",style: TextTheme.of(context).titleMedium,),
        backgroundColor: Color(0xFF268F8F).withOpacity(0.6),
      ),
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF268F8F),
        currentIndex: _selectedIndex,
        onTap: (newIndex) {
          setState(() {
            _selectedIndex = newIndex;
          });
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,   // ✅ hide text
        showUnselectedLabels: false, // ✅ hide text
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.man),
            label: "file",
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(child: Icon(Icons.add)),
            label: "add",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "setting",
          ),


        ],
      ),
    );
  }
}
