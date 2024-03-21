// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

Future sendEmail(
  String recipientEmail,
  String link,
) async {
  // Add your function code here!

  String username = 'jasminderwsp@gmail.com'; // Your email
  String password = 'nokia6110N'; // Your password
  String recipient = recipientEmail; // Recipient's email
  String urllink = link;

  // Create an SMTP client configuration
  final smtpServer = gmail(username, password);

  // Create a mail message
  final message = Message()
    ..from = Address(username, 'Your Name')
    ..recipients.add(recipient)
    ..subject = 'Test Email from Flutter'
    ..text = 'Click on this Link <a herf="$urllink">Click Here</a>';

  try {
    // Send the email
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } catch (e) {
    print('Error occurred: $e');
  }
}
