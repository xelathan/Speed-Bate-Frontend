import 'dart:async';
import 'package:flutter/material.dart';

class AnimatedCountdownTimer extends StatefulWidget {
  final int start;
  final Duration interval;
  final TextStyle textStyle;
  final VoidCallback? onFinished;

  const AnimatedCountdownTimer({
    Key? key,
    this.start = 3,
    this.interval = const Duration(seconds: 1),
    required this.textStyle,
    this.onFinished,
  }) : super(key: key);

  @override
  _AnimatedCountdownTimerState createState() => _AnimatedCountdownTimerState();
}

class _AnimatedCountdownTimerState extends State<AnimatedCountdownTimer>
    with TickerProviderStateMixin {
  late int countdown;
  bool showGo = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    countdown = widget.start;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    startCountdown();
  }

  void startCountdown() {
    Timer.periodic(widget.interval, (timer) {
      if (countdown > 1) {
        setState(() {
          countdown--;
        });
      } else {
        timer.cancel();
        setState(() {
          showGo = true;
        });
        // Start the animation when "GO!" is shown
        _animationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      child: showGo
          ? AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                // When the animation reaches the end, call onFinished
                if (_animationController.isCompleted &&
                    widget.onFinished != null) {
                  widget.onFinished!();
                }
                return Transform.scale(
                  scale: 1.4 *
                      _animationController
                          .value, // Scale up as animation progresses
                  child: Opacity(
                    opacity:
                        _animationController.value, // Fade in with animation
                    child: Text(
                      "GO!",
                      style: widget.textStyle.copyWith(
                        fontSize: 72, // Make the text large for emphasis
                      ),
                    ),
                  ),
                );
              },
            )
          : Text(
              "$countdown",
              key: ValueKey<int>(countdown),
              style: widget.textStyle,
            ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
