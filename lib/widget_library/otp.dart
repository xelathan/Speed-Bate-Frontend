import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speed_bate_frontend/primitives/themes.dart';

class OTPInputWidget extends StatefulWidget {
  final Function(
    String,
    void Function(String),
  ) onCompleted;
  final int length;
  final double spacing;
  final Color borderColor;
  final double borderWith;
  final Color focusColor;

  const OTPInputWidget({
    super.key,
    required this.onCompleted,
    this.borderColor = Colors.white,
    this.focusColor = cursorColor,
    this.borderWith = 1.0,
    this.length = 6,
    this.spacing = 8.0,
  });

  @override
  State<OTPInputWidget> createState() => _OTPInputWidgetState();
}

class _OTPInputWidgetState extends State<OTPInputWidget> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;
  late List<String> otpValues;
  String error = '';

  @override
  void initState() {
    super.initState();
    controllers =
        List.generate(widget.length, (index) => TextEditingController());
    focusNodes = List.generate(widget.length, (index) => FocusNode());
    otpValues = List.filled(widget.length, '');
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void setError(String error) => setState(() => this.error = error);

  void _onOTPDigitChanged(int index, String value) {
    if (value.isEmpty) {
      if (index > 0) {
        focusNodes[index - 1].requestFocus();
        controllers[index].clear();
        otpValues[index] = '';
      }
      return;
    }

    // Handle pasted text
    if (value.length > 1) {
      String pastedText = value;
      for (int i = 0; i < pastedText.length && i + index < widget.length; i++) {
        controllers[i + index].text = pastedText[i];
        otpValues[i + index] = pastedText[i];
        if (i + index < widget.length - 1) {
          focusNodes[i + index + 1].requestFocus();
        }
      }
    } else {
      // Handle single digit
      controllers[index].text = value;
      otpValues[index] = value;
      // Move to next field
      if (index < widget.length - 1) {
        focusNodes[index + 1].requestFocus();
      }
    }

    if (!otpValues.contains('')) {
      // Dismiss keyboard when OTP is complete
      FocusScope.of(context).unfocus();
      widget.onCompleted(otpValues.join(), setError);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.length,
            (index) => Container(
              margin: EdgeInsets.symmetric(horizontal: widget.spacing / 2),
              width: 50,
              height: 50,
              child: TextFormField(
                showCursor: false,
                controller: controllers[index],
                focusNode: focusNodes[index],
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 1,
                onChanged: (value) => _onOTPDigitChanged(index, value),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  counterText: '',
                  contentPadding: EdgeInsets.zero,
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: widget.borderColor,
                      width: widget.borderWith,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: widget.borderColor,
                      width: widget.borderWith,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: widget.focusColor,
                      width: widget.borderWith,
                    ),
                  ),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(1),
                ],
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: paddingMedium),
        Text(
          error,
          style: const TextStyle(color: Colors.red),
        ),
      ],
    );
  }
}
