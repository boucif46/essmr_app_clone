
import 'package:flutter/material.dart';
class ImageCircle extends StatefulWidget {
  final String imageUrl;
  final double size;

  ImageCircle({required this.imageUrl, required this.size});

  @override
  _ImageCircleState createState() => _ImageCircleState();
}

class _ImageCircleState extends State<ImageCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _animation = Tween<double>(begin: 1.0, end: 0.7).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  void _handlePanStart(DragStartDetails details) {
    _controller.forward();
  }

  void _handlePanUpdate(DragUpdateDetails details) {}

  void _handlePanEnd(DragEndDetails details) {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onPanStart: _handlePanStart,
      onPanUpdate: _handlePanUpdate,
      onPanEnd: _handlePanEnd,
      child: Transform.scale(
        scale: _animation.value,
        child: Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(widget.imageUrl),
            ),
          ),
        ),
      ),
    );
  }
}
