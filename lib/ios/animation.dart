import 'package:flutter/material.dart';

class animation_cantroller extends StatefulWidget {
  const animation_cantroller({super.key});

  @override
  State<animation_cantroller> createState() => _animation_cantrollerState();
}

class _animation_cantrollerState extends State<animation_cantroller>
    with SingleTickerProviderStateMixin {
  bool idFav = false;
  late AnimationController _controller;
  late Animation _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _colorAnimation =
        ColorTween(begin: Colors.white, end: Colors.red).animate(_controller);

    // _controller.forward();

    _controller.addListener(() {
    });
    // _controller.addStatusListener((status) {
    //   print(status);
    // });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          idFav = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          idFav = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, _) {
        return IconButton(
          onPressed: () {
            idFav ? _controller.reverse() : _controller.forward();
          },
          icon: Icon(
            Icons.favorite,
            color: _colorAnimation.value,
            size: 20,
          ),
        );
      },
    );
  }
}
