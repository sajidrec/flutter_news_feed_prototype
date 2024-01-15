import 'package:flutter/material.dart';

void main() {
  runApp(const NewsFeed());
}

class NewsFeed extends StatelessWidget {
  const NewsFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List newsList = List.generate(
    5,
    (index) => Container(
      width: double.infinity,
      // Make the container take the full width
      padding: const EdgeInsets.all(8.0),
      child: const Card(
        surfaceTintColor: Colors.white,
        elevation: 2,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Center(
              child: SizedBox(
                height: 150,
                width: 150,
                child: ColoredBox(color: Colors.grey),
              ),
            )),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "News Feed",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
          elevation: 2,
        ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return ListView.builder(
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  return newsList[index];
                },
              );
            } else {
              return GridView.builder(
                itemCount: newsList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return newsList[index];
                },
              );
            }
          },
        ));
  }
}
