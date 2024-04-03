import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyHelper {
  static Future<void> copyWithSnackbar(BuildContext context, String value, String snackbarText) async {
    await Clipboard.setData(ClipboardData(text: value)).then((value) {
      final theme = Theme.of(context);

      final snackBar = SnackBar(
        width: 173,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: SizedBox(
          height: 64,
          child: Center(
              child: Text(
            snackbarText,
            style: theme.textTheme.bodyMedium!.copyWith(color: Colors.white),
          )),
        ),
        behavior: SnackBarBehavior.floating,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }
}
