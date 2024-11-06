import 'package:flutter/material.dart';
import 'package:speed_bate_frontend/widget_library/countdown_timer.dart';

PreferredSizeWidget chatToolbar({
  required VoidCallback onMatchEnd,
  required VoidCallback onLeaveMatch,
  required VoidCallback showHelpModal,
  required bool timerPaused,
}) =>
    AppBar(
      leading: IconButton(
        onPressed: onLeaveMatch,
        icon: const Icon(Icons.arrow_back),
      ),
      title: CountdownTimer(
        onTimerEnd: onMatchEnd,
        duration: const Duration(minutes: 1),
        isPaused: timerPaused,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.question_mark),
          onPressed: showHelpModal,
        ),
      ],
    );
