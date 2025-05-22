import 'dart:async';
import 'package:flutter/material.dart';

class TimerExample extends StatefulWidget {
  @override
  State<TimerExample> createState() => _TimerExampleState();
}

class _TimerExampleState extends State<TimerExample> {
  Timer? _timer;
  bool _isRunning = false;
  Duration _elapsed = Duration.zero;
  DateTime? _startTime;

  void _toggleTimer() {
    if (_isRunning) {
      // Pause
      _timer?.cancel();
      setState(() => _isRunning = false);
    } else {
      // Start
      _startTime ??= DateTime.now();
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          _elapsed += Duration(seconds: 1);
        });
      });
      setState(() => _isRunning = true);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String formatDuration(Duration duration) {
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes =
        duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Timer Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _startTime != null
                  ? "Start Time: ${_startTime.toString()}"
                  : "Press Start to Begin",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text(
              "Elapsed: ${formatDuration(_elapsed)}",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _toggleTimer,
              child: Text(_isRunning ? "Pause" : "Start"),
            ),
          ],
        ),
      ),
    );
  }
}
