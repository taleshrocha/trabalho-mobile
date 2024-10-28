import 'package:flutter/material.dart';
import 'package:trabalho_mobile/themes/theme.dart';

class RemoveDialog extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback handleRemove;

  const RemoveDialog({
    super.key,
    required this.title,
    required this.subTitle,
    required this.handleRemove,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    ButtonStyle cancelButtonStyle = ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(AppTheme.highlightDark),
      foregroundColor: WidgetStateProperty.all<Color>(AppTheme.neutralLightest),
      padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
    ButtonStyle yesButtonStyle = ButtonStyle(
      backgroundColor:
          WidgetStateProperty.all<Color>(AppTheme.supportErrorDark),
      foregroundColor: WidgetStateProperty.all<Color>(AppTheme.neutralLightest),
      padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );

    return AlertDialog(
      title: Center(
        child: Text(
          title,
          style: theme.textTheme.headlineMedium,
        ),
      ),
      content: Text(
        subTitle,
        style: const TextStyle(color: AppTheme.neutralDarkDarkest),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: handleRemove,
              style: yesButtonStyle,
              child: const Text(
                'Sim',
              ),
            ),
            const SizedBox(width: 16),
            TextButton(
              child: const Text('Cancelar'),
              style: cancelButtonStyle,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ],
    );
  }
}
