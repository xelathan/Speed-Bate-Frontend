import 'package:flutter/material.dart';
import 'package:speed_bate_frontend/chat/ui/chat_view_model.dart';
import 'package:speed_bate_frontend/widget_library/animated_countdown_timer.dart';
import 'package:speed_bate_frontend/widget_library/pop_in_text.dart';

class ChatStartingOverlay extends StatefulWidget {
  const ChatStartingOverlay({
    required this.setChatMatchStatus,
    required this.debateTopic,
    super.key,
  });

  final void Function(ChatMatchStatus) setChatMatchStatus;
  final String debateTopic;

  @override
  ChatStartingOverlayState createState() => ChatStartingOverlayState();
}

class ChatStartingOverlayState extends State<ChatStartingOverlay> {
  bool showCountdown = false;

  @override
  Widget build(BuildContext context) => Material(
        type: MaterialType.transparency,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
          color: Colors.black54,
          child: Column(
            children: [
              const Text(
                "Topic",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: PopInOutText(
                  text: widget.debateTopic,
                  textAlign: TextAlign.center,
                  delay: const Duration(seconds: 1),
                  onAnimationFinished: () {
                    // Wait for 1 second before showing the countdown timer
                    Future.delayed(const Duration(seconds: 1), () {
                      if (mounted) {
                        setState(() {
                          showCountdown = true; // Show and start countdown
                        });
                      }
                    });
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              Visibility(
                visible: showCountdown,
                child: AnimatedCountdownTimer(
                  start: 5,
                  textStyle: const TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                  ),
                  onFinished: () {
                    Future.delayed(const Duration(milliseconds: 250), () {
                      widget.setChatMatchStatus(ChatMatchStatus.inProgress);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      );
}
