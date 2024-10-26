import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stylish Voice Assistant UI',
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: VoiceAssistantUI(),
    );
  }
}

class VoiceAssistantUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.white70, size: 28),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white70, size: 28),
            onPressed: () {},
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background gradient for a modern look
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Color(0xFF1F1F1F)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Animated background blobs
          Positioned.fill(
            child: AnimatedBlobBackground(),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Assistant's Name
                Text(
                  'Talking to Sundae',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    color: Colors.white.withOpacity(0.95),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // Listening Prompt
                Text(
                  'Go ahead, I\'m listening...',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
                // Gradient Animated Circle for voice visualization
                AnimatedGradientCircle(),
                // Question Text
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Tell me the simple timeline of human history based on the book Sapiens',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.white.withOpacity(0.85),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // Floating Voice Input Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    backgroundColor: Colors.blueAccent.withOpacity(0.8),
                    shadowColor: Colors.blueAccent.withOpacity(0.5),
                    elevation: 10,
                  ),
                  child: Icon(Icons.mic, size: 40, color: Colors.white),
                  onPressed: () {
                    // Voice Input action
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Animated Circle for modern look
class AnimatedGradientCircle extends StatefulWidget {
  @override
  _AnimatedGradientCircleState createState() => _AnimatedGradientCircleState();
}

class _AnimatedGradientCircleState extends State<AnimatedGradientCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                Colors.purple.withOpacity(_controller.value),
                Colors.blue.withOpacity(0.7 + _controller.value * 0.3),
                Colors.pink.withOpacity(0.6),
                Colors.yellow.withOpacity(0.5),
              ],
              stops: [0.0, 0.5, 0.8, 1.0],
              center: Alignment.center,
              radius: 1.0 + _controller.value * 0.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.blueAccent.withOpacity(0.3),
                blurRadius: 25,
                spreadRadius: 2,
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// Animated Blob Background for modern look
class AnimatedBlobBackground extends StatefulWidget {
  @override
  _AnimatedBlobBackgroundState createState() => _AnimatedBlobBackgroundState();
}

class _AnimatedBlobBackgroundState extends State<AnimatedBlobBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 8),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          children: [
            Positioned(
              left: 50 + 20 * _controller.value,
              top: 100 - 30 * _controller.value,
              child: Blob(color: Colors.purple.withOpacity(0.2), size: 150),
            ),
            Positioned(
              right: 30 - 20 * _controller.value,
              bottom: 150 + 30 * _controller.value,
              child: Blob(color: Colors.blue.withOpacity(0.2), size: 200),
            ),
            Positioned(
              right: 90 + 10 * _controller.value,
              top: 200 - 10 * _controller.value,
              child: Blob(color: Colors.pink.withOpacity(0.2), size: 120),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class Blob extends StatelessWidget {
  final Color color;
  final double size;

  Blob({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color,
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
    );
  }
}
