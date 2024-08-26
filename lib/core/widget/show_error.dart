import 'package:flutter/material.dart';

void showErrorDialog(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: const Text('خطأ', textAlign: TextAlign.right),
          content: Text(errorMessage, textAlign: TextAlign.right),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('حسنًا'),
            ),
          ],
        ),
      );
    },
  );
}