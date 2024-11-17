import 'package:flutter/material.dart';
import 'package:speed_bate_frontend/chat/ui/chat_view_model.dart';
import 'package:speed_bate_frontend/widget_library/countdown_timer.dart';

PreferredSizeWidget chatToolbar({
  required VoidCallback onMatchEnd,
  required VoidCallback onLeaveMatch,
  required VoidCallback showHelpModal,
  required ChatMatchStatus chatMatchStatus,
}) =>
    AppBar(
      leading: IconButton(
        onPressed: onLeaveMatch,
        icon: const Icon(Icons.arrow_back),
      ),
      title: CountdownTimer(
        start: chatMatchStatus == ChatMatchStatus.inProgress,
        onTimerEnd: onMatchEnd,
        duration: const Duration(minutes: 1),
        isPaused: chatMatchStatus == ChatMatchStatus.ended,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.question_mark),
          onPressed: showHelpModal,
        ),
      ],
    );
