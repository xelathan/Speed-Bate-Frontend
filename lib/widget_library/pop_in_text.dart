import 'package:flutter/material.dart';

class PopInOutText extends StatefulWidget {
  const PopInOutText({
    required this.text,
    this.delay = Duration.zero,
    this.onAnimationFinished,
    this.style = const TextStyle(fontSize: 24),
    this.textAlign = TextAlign.left,
    super.key,
  });

  final String text;
  final Duration delay;
  final VoidCallback? onAnimationFinished;
  final TextStyle style;
  final TextAlign textAlign;

  @override
  _PopInOutTextState createState() => _PopInOutTextState();
}

class _PopInOutTextState extends State<PopInOutText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration:
          const Duration(milliseconds: 800), // Shorter duration for pop effect
    );

    _scaleAnimation = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 1.2)
            .chain(CurveTween(curve: Curves.easeOutBack)),
        weight: 70,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.2, end: 0.9)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 15,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.9, end: 1.0)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 15,
      ),
    ]).animate(_controller);

    // Start the animation with a delay, then trigger onAnimationFinished when done
    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward().then((_) {
          if (widget.onAnimationFinished != null) {
            widget.onAnimationFinished!();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Text(
        widget.text,
        textAlign: widget.textAlign,
        style: widget.style,
      ),
    );
  }
}
