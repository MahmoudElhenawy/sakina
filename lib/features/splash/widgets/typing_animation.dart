import 'package:flutter/material.dart';

class TypingText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final int repeatCount;
  final VoidCallback? onCompleted;

  const TypingText({
    super.key,
    required this.text,
    required this.style,
    this.repeatCount = 2,
    this.onCompleted,
  });

  @override
  State<TypingText> createState() => _TypingTextState();
}

class _TypingTextState extends State<TypingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _currentRepeat = 0;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 2000),
        )..addStatusListener((status) async {
          if (status == AnimationStatus.completed) {
            await Future.delayed(const Duration(milliseconds: 600));
            _controller.reset();
            _currentRepeat++;

            if (_currentRepeat < widget.repeatCount) {
              _controller.forward();
            } else {
              widget.onCompleted?.call();
            }
          }
        });

    Future.delayed(const Duration(milliseconds: 800), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final count = (widget.text.length * _controller.value).round();

        return Text(
          widget.text.substring(0, count),
          style: widget.style,
          textAlign: TextAlign.center,
        );
      },
    );
  }
}
