import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:lejit/constants/colors.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  int _secondsRemaining = 20;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            const Text(
              'Verification',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "We've sent you the verification\n code on +91 9876543210",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const OtpField(),
            const SizedBox(height: 40),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  //TODO: implement handler for OTP
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: navyBlue,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'CONTINUE',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Re-send code in 0:${_secondsRemaining.toString().padLeft(2, '0')}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OtpField extends StatelessWidget {
  const OtpField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      fieldHeight: 60,
      fieldWidth: 60,
      showFieldAsBox: true,
      numberOfFields: 4,
      autoFocus: true,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      keyboardType: TextInputType.number,
      filled: true,
      // borderRadius: BorderRadius.circular(10),
      onSubmit: (code) => print(
          "OTP is => $code"), //TODO: implement verifitcation, remove print statement
    );
  }
}
