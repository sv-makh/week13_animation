import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  final List<String>? imageUrls;

  GalleryScreen(this.imageUrls);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rabbit\'s guests Animations'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: List.generate(
              imageUrls!.length,
              (index) => Card(
                child: SizedBox(
                  height: 200,
                  child: FadeInImage(
                    placeholder: AssetImage('images/3066814584_0d0db6817c.jpg'),
                    image: NetworkImage(imageUrls![index]),
                  )
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
