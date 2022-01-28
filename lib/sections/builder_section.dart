import 'package:basic_animations/gallery_screen.dart';
import 'package:flutter/material.dart';

class BuilderSection extends StatefulWidget {
  final List<String>? imageUrls;

  BuilderSection({
    required this.imageUrls,
  });

  @override
  State<BuilderSection> createState() => _BuilderSectionState();
}

class _BuilderSectionState extends State<BuilderSection> with SingleTickerProviderStateMixin{
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
            AnimatedBuilder(
              animation: _heightAnimation,
              child: Image.network(widget.imageUrls![0]),
              builder: (context, child) {
                return SizedBox(
                  height: _heightAnimation.value,
                  width: 150,
                  child: child
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
