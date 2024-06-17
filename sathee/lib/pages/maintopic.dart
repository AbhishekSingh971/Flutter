import 'package:flutter/material.dart';
import 'package:sathee/math_topics.dart';
import 'package:sathee/pages/subtopic.dart';

class MainTopic extends StatefulWidget {
  const MainTopic({super.key});

  @override
  State<MainTopic> createState() => _MainTopicState();
}

class _MainTopicState extends State<MainTopic> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Expanded(
        // instead of meadiaquery
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 1080) {
              return GridView.builder(
                  itemCount: mainTopics.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1.75),
                  itemBuilder: (context, index) {
                    final topic = mainTopics[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return SubTopic(index : index);
                            },
                          ),
                        );
                      },
                      child: ListTile(title: Text(topic['title'] as String)),
                    );
                  });
            } else {
              return ListView.builder(
                itemCount: mainTopics.length,
                itemBuilder: (context, index) {
                  final topic = mainTopics[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return SubTopic(index: index);
                          },
                        ),
                      );
                    },
                    child: Text(topic['title'] as String),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
