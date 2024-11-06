import 'package:flutter/material.dart';
import 'package:speed_bate_frontend/chat/ui/chat_view_model.dart';
import 'package:speed_bate_frontend/widget_library/animated_countdown_timer.dart';
import 'package:speed_bate_frontend/widget_library/pop_in_text.dart';

class ChatStartingOverlay extends StatefulWidget {
  const ChatStartingOverlay({
    required this.setChatMatchStatus,
    super.key,
  });

  final void Function(ChatMatchStatus) setChatMatchStatus;

  @override
  _ChatStartingOverlayState createState() => _ChatStartingOverlayState();
}

class _ChatStartingOverlayState extends State<ChatStartingOverlay> {
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
              Text(
                "Topic",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              PopInOutText(
                text: "Trump or Biden",
                delay: Duration(seconds: 1),
                onAnimationFinished: () {
                  // Wait for 1 second before showing the countdown timer
                  Future.delayed(Duration(seconds: 1), () {
                    if (mounted) {
                      setState(() {
                        showCountdown = true; // Show and start countdown
                      });
                    }
                  });
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              Visibility(
                visible: showCountdown,
                child: AnimatedCountdownTimer(
                  textStyle: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                  ),
                  onFinished: () {
                    Future.delayed(Duration(milliseconds: 500), () {
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
