import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CustomError extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const CustomError({
    Key? key,
    required this.errorDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                'images/error_illustration.png'),
            Expanded(
              child: Text(
                kDebugMode
                    ? errorDetails.summary.toString()
                    : 'OOPS! Something went wrong!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: kDebugMode ? Colors.red : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 21),
              ),
            ),
            const Expanded(child: SizedBox(height: 12)),
            const Expanded(
              child: Text(
                kDebugMode
                    ? 'https://docs.flutter.dev/testing/errors'
                    : "We encountered an error and we've notified our engineering team about it. Sorry for the inconvenience caused.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}