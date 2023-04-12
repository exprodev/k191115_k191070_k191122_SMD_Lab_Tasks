import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gmail',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.dark,
      ),
      home: InboxPage(),
    );
  }
}

class InboxPage extends StatelessWidget {
  final List<String> inboxItems = [    'New Message from John',    'Meeting at 2 PM',    'Updates from your subscriptions',    'Re: Dinner plans tonight',    'Reminder: Pay rent by tomorrow',    'Your order has shipped',    'Don\'t forget to call Mom',    'Welcome to the team!'  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search mail',
            border: InputBorder.none,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: CircleAvatar(
              child: Text('AB'),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: inboxItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text('A'),
            ),
            title: Text(
              inboxItems[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  '12:05 PM',
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                SizedBox(height: 4.0),
                Icon(
                  Icons.star_border,
                  size: 16.0,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

