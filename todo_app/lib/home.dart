import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/colors.dart';
import 'dart:convert';
import 'package:todo_app/widget.dart';

import 'package:todo_app/login.dart';

class HomePage extends StatefulWidget {
  final UserPassArgument userPass;
  static const routeName = '/home';

  const HomePage({required this.userPass, super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> cards = [
    todoCard(icon: const Icon(Icons.book), title: const Text('read book')),
    todoCard(icon: const Icon(Icons.book), title: const Text('read book'))
  ];

  final appBarheight = 84.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context: context, widget: widget),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'ToDo',
          style: TextStyle(fontSize: 24),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.cyanAccent),
        child: SizedBox(
          child: Column(
            children: [
              SizedBox(
                height: appBarheight + 80,
              ),
              const Text(
                'these are your todo collections',
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 80,
              ),
              CarouselSlider.builder(
                  itemCount: cards.length,
                  itemBuilder: (context, index, realIndex) {
                    return cards[index];
                  },
                  options: CarouselOptions(
                      enableInfiniteScroll: false,
                      enlargeCenterPage: true,
                      viewportFraction: 0.75,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      height: 240,
                      aspectRatio: 1 / 1)),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: const Icon(Icons.add),
      ),
    );
  }
}

Widget buildListTitle(
    {required Icon icon, required String text, required VoidCallback ontap}) {
  return ListTile(
    iconColor: Colors.white,
    textColor: Colors.white,
    leading: icon,
    title: Text(text),
    onTap: ontap,
  );
}
