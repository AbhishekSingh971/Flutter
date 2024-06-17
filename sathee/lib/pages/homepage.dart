import 'package:flutter/material.dart';
import 'package:sathee/math_topics.dart';
import 'package:sathee/pages/maintopic.dart';
import 'package:sathee/pages/subtopic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageApp();
}

class _HomePageApp extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 100.0,
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            flexibleSpace: Padding(
              padding: const EdgeInsets.only(left: 50),
              child: FlexibleSpaceBar(
                title: Text(
                  'SATHEE',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 40,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Self Assessment, Test and Help for Entrance Exams',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Colors.blue),
                    ),
                    Text(
                      'Play With Us',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final topic = mainTopics[index];
                return Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  height: 40.0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return SubTopic(index: index);
                        }),
                      );
                    },
                    child: Chip(
                      elevation: 10.0,
                      shadowColor: Colors.grey,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      label: Text(
                        topic['title'] as String,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                );
              },
              childCount: mainTopics.length,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
              ),
              child: Text(
                'SATHEE',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: const Text('Math'),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Chemistry'),
              selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                _onItemTapped(1);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Physics'),
              selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
