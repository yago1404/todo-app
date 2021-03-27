import 'package:flutter/material.dart';

confirmDialog(
    {required BuildContext context,
    String? message,
    String? title,
    Function? confirmFunction}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title!),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(message!),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                confirmFunction!();
                Navigator.pop(context);
              },
              child: Text("Confirmar"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancelar"),
            ),
          ],
        );
      });
}
