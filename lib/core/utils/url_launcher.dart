import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> urlLauncher({required String? url, required context}) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (!await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Cannot Launch Url',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
