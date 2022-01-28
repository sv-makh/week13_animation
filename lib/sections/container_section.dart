import 'package:basic_animations/gallery_screen.dart';
import 'package:flutter/material.dart';

class ContainerSection extends StatefulWidget {
  final List<String>? imageUrls;

  ContainerSection({
    required this.imageUrls,
  });

  @override
  State<ContainerSection> createState() => _ContainerSectionState();
}

class _ContainerSectionState extends State<ContainerSection> with SingleTickerProviderStateMixin{
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

    _heightAnimation.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
            AnimatedContainer(
              height: show ? 150 : 0,
              width: 150,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              child: Image.network(widget.imageUrls![0]),
            ),
          ],
        ),
      ),
    );
  }
}
