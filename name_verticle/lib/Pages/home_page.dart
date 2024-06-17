import "package:flutter/material.dart";
import 'package:name_verticle/Provider/text_list_provider.dart';
import "package:provider/provider.dart";

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int rotate = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void change() {
    Provider.of<TextProvider>(context, listen: false)
        .add(textEditingController.text);
    setState(() {});
  }

  void rotat() {
    if (rotate == 0) {
      rotate = 1;
    } else if (rotate == 1) {
      rotate = -1;
    } else {
      rotate = 0;
    }
    setState(() {});
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textlist = context.watch<TextProvider>().textList;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Rotate text'),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              const InputChip(
                label: Text(
                  "Enter your name",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: textEditingController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      hintText: "Enter your name",
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(0, 0, 0, 0.3))),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: change,
                    child: const Text('Convert'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: rotat,
                    child: const Text('Rotate'),
                  ),
                ],
              ),
              SizedBox(
                height: 500,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: textlist.length,
                  itemBuilder: (context, index) {
                    final text = textlist[index];

                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 400,
                            width: 200,
                            padding: const EdgeInsets.all(10),
                            child: Card(
                              elevation: 20,
                              shadowColor: const Color.fromRGBO(0, 0, 0, 1),
                              margin: const EdgeInsets.only(top: 20),
                              color: Colors.black,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              child: ClipRRect(
                                child: Center(
                                  child: RotatedBox(
                                    quarterTurns: rotate,
                                    child: Text(
                                      text,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                      title: Text('Delete Product',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium),
                                      content: const Text(
                                          'Are you sure you want to remove the Text Item from the List'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text(
                                            'No',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            context
                                                .read<TextProvider>()
                                                .removeText(text);
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text(
                                            'Yes',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ]);
                                });
                          },
                          child: const Icon(Icons.delete, color: Colors.red),
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
