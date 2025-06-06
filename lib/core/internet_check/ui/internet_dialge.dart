

import 'package:flutter/material.dart';

void showNoInternetDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Text(
        'No Internet Connection',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: const Text(
        'Please enable your internet connection to Continue.',
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    ),
  );
}