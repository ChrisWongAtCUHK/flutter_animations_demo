// [【前端的 Flutter 新手村】Day18-讓App進入不同層次的Animation(二)-AnimatedContainer](https://ithelp.ithome.com.tw/articles/10224543)
import 'package:flutter/material.dart';

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({super.key});

  @override
  AnimatedContainerScreenState createState() => AnimatedContainerScreenState();
}

class AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    var screenSizeWidth = MediaQuery.of(context).size.width;
    var screenSizeHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Center(
            child: AnimatedContainer(
          width: selected ? screenSizeWidth : 200,
          height: selected ? screenSizeHeight : 50,
          color: selected ? Colors.red[200] : Colors.lightGreen[600],
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          curve: Curves.fastLinearToSlowEaseIn,
          child: (Text(
            'Click Me!',
            style: TextStyle(
              fontSize: selected ? 0 : 24,
              color: selected
                  ? const Color.fromRGBO(255, 255, 255, 0)
                  : const Color.fromRGBO(255, 255, 255, 1),
            ),
          )),
        )));
  }
}
