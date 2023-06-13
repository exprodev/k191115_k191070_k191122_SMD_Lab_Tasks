import 'package:flutter/material.dart';
import 'package:cat_ui/my_list_items.dart';
import 'package:cat_ui/my_profile.dart';
import 'profile_model.dart';
import 'my_app_bar.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileModel>(context);

    final _widgetOptions = <Widget>[
      MyListItems(profile: profile),
      MyProfile(),
    ];

    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Cats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: 'Me',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 243, 128, 33),
        unselectedItemColor: Color.fromARGB(255, 0, 0, 0),
        onTap: _onItemTapped,
      ),
    );
  }
}