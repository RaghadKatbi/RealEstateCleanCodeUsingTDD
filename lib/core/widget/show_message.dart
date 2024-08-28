import 'package:flutter/material.dart';

void showMessageDialog(BuildContext context, String Message,String title) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title:  Text(title, textAlign: TextAlign.right),
          content: Text(Message, textAlign: TextAlign.right),
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