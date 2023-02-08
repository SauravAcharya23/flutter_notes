import 'package:flutter/material.dart';
import 'package:notes/widgets/appbar.dart';
import 'package:notes/widgets/floating_button.dart';
import 'package:notes/widgets/search_box.dart';

import '../widgets/all_display_button.dart';
import '../widgets/items.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: appbar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),        
        child: Column(
          children: <Widget>[
            searchBar(),
            allText(),
            items(),
          ],
        ),
      ),
      floatingActionButton: floatingButton()
    );
  }
}
