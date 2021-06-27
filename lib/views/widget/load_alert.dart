import 'package:flutter/material.dart';

loadAlert(context, {message = 'Carregando'}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(message),
        content: CircularProgressIndicator(),
      );
    },
  );
}
