import 'package:basic_animations/gallery_screen.dart';
import 'package:flutter/material.dart';

class SimpleSection extends StatefulWidget {
  final List<String>? imageUrls;

  SimpleSection({
    required this.imageUrls,
  });

  @override
  State<SimpleSection> createState() => _SimpleSectionState();
}

class _SimpleSectionState extends State<SimpleSection> with SingleTickerProviderStateMixin{
  bool show = false;

  late AnimationController _controller;
  late Animation<double> _heightAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _heightAnimation = Tween<double>(begin: 0, end: 150).animate(
      CurvedAnimation(parent: _controller, curve: Curves.ease),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    if (show == false) {
                      _controller.forward();
                      show = true;
                    } else {
                      _controller.reverse();
                      show = false;
                    }
                    /*setState(() {
                      show = !show;
                    });*/
                  },
                  child: Text(show ? 'Hide Guest' : 'Show Guest'),
                ),
                OutlinedButton(
                  child: Text('Show Gallery'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GalleryScreen(widget.imageUrls),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: _heightAnimation.value,
              width: 150,
              child: Image.network(widget.imageUrls![0]),
            ),
          ],
        ),
      ),
    );
  }
}
