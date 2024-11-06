import 'dart:async';

import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  final Duration duration;
  final VoidCallback onTimerEnd;
  final bool isPaused; // New parameter to control pause state

  const CountdownTimer({
    Key? key,
    required this.duration,
    required this.onTimerEnd,
    required this.isPaused,
  }) : super(key: key);

  @override
  CountdownTimerState createState() => CountdownTimerState();
}

class CountdownTimerState extends State<CountdownTimer> {
  late int _remainingMilliseconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remainingMilliseconds = widget.duration.inMilliseconds;
    _startTimer();
  }

  @override
  void didUpdateWidget(CountdownTimer oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reset timer if duration changes
    if (oldWidget.duration != widget.duration) {
      _remainingMilliseconds = widget.duration.inMilliseconds;
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      if (_remainingMilliseconds > 0 && !widget.isPaused) {
        setState(() {
          _remainingMilliseconds -= 10;
        });
      } else if (_remainingMilliseconds <= 0) {
        timer.cancel();
        widget.onTimerEnd();
      }
    });
  }

  String get _timeString {
    int minutes = _remainingMilliseconds ~/ 60000;
    int seconds = (_remainingMilliseconds % 60000) ~/ 1000;
    int milliseconds = (_remainingMilliseconds % 1000) ~/ 10;
    return '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}:'
        '${milliseconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Text(
        _timeString,
        style: TextStyle(
          color: widget.isPaused ? Colors.grey : null,
        ),
      );
}
