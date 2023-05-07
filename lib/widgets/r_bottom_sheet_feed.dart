import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NewsFeedSwipable extends StatefulWidget {
  const NewsFeedSwipable({super.key});

  @override
  State<NewsFeedSwipable> createState() => _NewsFeedSwipableState();
}

class _NewsFeedSwipableState extends State<NewsFeedSwipable> {
  bool isSwipedUp = false;
  double _position = 0;

  swipeUp() {
    setState(() {
      isSwipedUp = true;
    });
  }

  swipeDown() {
    setState(() {
      isSwipedUp = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    const animationDuration = Duration(milliseconds: 300);

    double mHieght = MediaQuery.of(context).size.height;
    double mWidth = MediaQuery.of(context).size.width;

    return Container(
      height: mHieght,
      width: mWidth,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: animationDuration,
            height: mHieght,
            color: Colors.amber.shade100,
            width: mWidth,
            child: const Text("Map"),
          ),
          AnimatedPositioned(
            duration: animationDuration,
            bottom: _position,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Container(
                color: Colors.blue.shade100,
                // height: isSwipedUp ? mHieght * 0.6 : mHieght * 0.08,
                height: 50,
                width: mWidth,
                child: Column(
                  children: [
                    GestureDetector(
                      onPanEnd: (details) {
                        setState(() {
                          print(details.velocity.pixelsPerSecond.direction);
                          if (details.velocity.pixelsPerSecond.direction < 0)
                            _position = mHieght - 150;
                          else if (details.velocity.pixelsPerSecond.direction >
                              0)
                            _position = 0;
                          else {
                            if (_position > mHieght * 0.50)
                              _position = mHieght - 150;
                            else
                              _position = 0;
                          }
                          // if (_position < mHieght * 0.7) _position = 0;
                        });
                      },
                      onPanUpdate: ((DragUpdateDetails details) {
                        setState(() {
                          _position -= _position >= 0 ? details.delta.dy : 0;

                          // print(_position);
                        });
                      }),
                      child: Container(
                        width: mWidth,
                        child: Icon(Icons.dehaze_sharp),
                      ),
                    ),
                    Text(_position.toString())
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
