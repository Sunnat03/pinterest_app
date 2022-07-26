import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget HomePageSliverAppBar(BuildContext context, bool isScrolled, TabController _tabController){
  const List<Tab> myTabs = [
    Tab(text: 'For you', height: 28),
    Tab(text: 'Today', height: 28),
    Tab(text: 'Following', height: 28),
    Tab(text: 'Health', height: 28),
    Tab(text: 'Recipes', height: 28),
  ];
  return SliverAppBar(
    backgroundColor: Colors.white,
    toolbarHeight: 35,
    expandedHeight: 40,
    collapsedHeight: 40,
    title: const Image(
      image: AssetImage('assets/cash/img_2.png'),
      width: 120,
      alignment: Alignment.bottomCenter,
      // fit: BoxFit.cover,
    ),
    pinned: true,
    floating: true,
    snap: true,
    forceElevated: isScrolled,
    // bottom: TabBar(
    //   tabs: const <Widget>[
    //     Tab(
    //       text: "Home",
    //       icon: Icon(Icons.home),
    //     ),
    //     Tab(
    //       text: "Example page",
    //       icon: Icon(Icons.help),
    //     ),
    //     Tab(
    //       text: "Example page",
    //       icon: Icon(Icons.help),
    //     ),
    //     Tab(
    //       text: "Home",
    //       icon: Icon(Icons.home),
    //     ),
    //     Tab(
    //       text: "Example page",
    //       icon: Icon(Icons.help),
    //     )
    //   ],
    //   controller: _tabController,
    // ),
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: MediaQuery.of(context).size.shortestSide > 600
          ? Size.fromHeight(
          MediaQuery.of(context).size.shortestSide * 0.045)
          : Size.fromHeight(
          MediaQuery.of(context).size.shortestSide * 0.072),
      child: TabBar(
        controller: _tabController,
        isScrollable: true,
        unselectedLabelColor: Colors.blueGrey,
        padding: const EdgeInsets.all(0),
        labelPadding: EdgeInsets.symmetric(
            horizontal:
            MediaQuery.of(context).size.shortestSide / 15,
            vertical: 0),
        labelColor: Colors.black,
        indicator: BoxDecoration(
            borderRadius:
            BorderRadius.circular(10), // Creates border
            color: Colors.grey.shade300),
        tabs: myTabs,
      ),
    ),
  );
}
