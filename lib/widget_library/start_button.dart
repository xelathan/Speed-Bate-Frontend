import 'package:flutter/material.dart';
import 'package:speed_bate_frontend/primitives/themes.dart';

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
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    // Define the scale animation (from 0 to full size)
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutBack,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _animateButton() {
    if (widget.isMatching) {
      _animationController.reverse(); // Scale back to normal size
    } else {
      _animationController.forward(); // Scale up to larger size
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: MaterialButton(
        color: Theme.of(context).buttonTheme.colorScheme?.primary,
        onPressed: !widget.isMatching
            ? () {
                widget.startMatchmaking();
                _animateButton();
              }
            : () {
                widget.cancelMatchmaking();
                _animateButton();
              },
        padding: const EdgeInsets.all(24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusMedium),
        ),
        child: Text(
          !widget.isMatching ? "Debate!" : "Cancel",
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
