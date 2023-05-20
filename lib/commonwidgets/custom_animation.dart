import 'package:flutter/material.dart';

class AnimatedCustomSnackbar extends StatefulWidget {
  final String message;
  final Duration duration;

  const AnimatedCustomSnackbar(
      {super.key, required this.message, required this.duration});

  @override
  _AnimatedCustomSnackbarState createState() => _AnimatedCustomSnackbarState();
}

class _AnimatedCustomSnackbarState extends State<AnimatedCustomSnackbar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _slideAnimation = Tween<double>(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(widget.duration, () {
          _animationController.reverse();
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
              0.0, _slideAnimation.value * MediaQuery.of(context).size.height),
          child: Opacity(
            opacity: _slideAnimation.value.clamp(0.0, 1.0),
            child: child,
          ),
        );
      },
      child: Container(
        height: 20.0,
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text(
          widget.message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
