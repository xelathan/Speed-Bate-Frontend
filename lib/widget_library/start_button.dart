import 'package:flutter/material.dart';

class StartButton extends StatefulWidget {
  const StartButton({
    required this.isMatching,
    required this.startMatchmaking,
    required this.cancelMatchmaking,
    super.key,
  });

  final bool isMatching;
  final VoidCallback startMatchmaking;
  final VoidCallback cancelMatchmaking;

  @override
  _StartButtonState createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _bounceAnimation;
  bool _isMovedDown = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    // Define the Tween for the Y offset (0 to 200) with bounce effect.
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _animateButton({
    required VoidCallback onComplete,
  }) {
    setState(() {
      _isMovedDown = !_isMovedDown;
      if (_isMovedDown) {
        _animationController.forward().whenCompleteOrCancel(
              () => onComplete(),
            ); // Animate downwards with bounce
      } else {
        _animationController.reverse(); // Animate upwards smoothly
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _bounceAnimation =
        Tween<double>(begin: 0.0, end: MediaQuery.of(context).size.height / 10)
            .animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutBack, // Bounce downwards
        reverseCurve: Curves.easeInOutBack, // Smooth upwards motion
      ),
    )..addListener(() {
            setState(() {}); // Trigger rebuild for every animation tick
          });
    return Transform.translate(
      offset: Offset(0, _bounceAnimation.value),
      child: MaterialButton(
        color: Theme.of(context).buttonTheme.colorScheme?.primary,
        onPressed: !widget.isMatching
            ? () {
                widget.startMatchmaking();
                _animateButton(onComplete: () {});
              }
            : () {
                widget.cancelMatchmaking();
                _animateButton(onComplete: () {});
              },
        padding: const EdgeInsets.all(24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          !widget.isMatching ? "Debate!" : "Cancel",
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
