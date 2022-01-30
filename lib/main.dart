import 'package:basic_animations/sections/container_section.dart';
import 'package:basic_animations/sections/simple_section.dart';
import 'package:basic_animations/sections/manual_section.dart';
import 'package:basic_animations/sections/builder_section.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Rabbit\'s guests Animations'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                ManualSection(imageUrls: characterImages['winnie']),
                BuilderSection(imageUrls: characterImages['piglet']),
                ContainerSection(imageUrls: characterImages['rabbit']),
                SimpleSection(imageUrls: characterImages['eeyore']),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Map<String, List<String>> characterImages = {
  'winnie': [
    'https://chepetsk.ru/upload/iblock/e91/e910dc68028e4a10d6ba9d5c02febcba.jpg',
    'https://i.pinimg.com/474x/6e/c1/d7/6ec1d708429bb0840ac5c9a8fedd3ef4.jpg',
    'https://upload.wikimedia.org/wikipedia/en/1/10/Winniethepooh.png',
  ],
  'piglet': [
    'https://pbs.twimg.com/profile_images/1583264740/babf928a7fb6_400x400.jpg',
    'https://i.pinimg.com/originals/0e/20/4c/0e204c5dae02079c9aed2bd2473ab993.jpg',
    'https://upload.wikimedia.org/wikipedia/ru/d/dd/Pigletdisney.jpg',
  ],
  'rabbit': [
    'https://static.wikia.nocookie.net/vinni/images/b/bf/K03.jpg/revision/latest/scale-to-width-down/201?cb=20140320091447&path-prefix=ru',
    'https://i.pinimg.com/736x/96/b5/df/96b5df4d7f69732357c427133eb2b804--winnie-the-pooh-nursery-literature-books.jpg',
    'https://static.wikia.nocookie.net/characters/images/d/da/Conejo_WTP.png/revision/latest?cb=20180215035019',
  ],
  'eeyore': [
    'https://static.wikia.nocookie.net/vinni-puh-fanon/images/8/80/1595725675_7-p-fon-papirus-7.jpg/revision/latest?cb=20210806065917&path-prefix=ru',
    'https://i.pinimg.com/originals/66/08/94/6608944b6c8cd0ba75adce48d365fe34.jpg',
    'https://static.wikia.nocookie.net/disney/images/1/1c/Profile_-_Eeyore.png/revision/latest?cb=20210516060155',
  ],
};
