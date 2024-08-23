import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'my_app.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) {
        return MaterialApp(
          // ignore: deprecated_member_use
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          home: const DemoApp(),
        );
      },
      devices: Devices.all,
    ),
  );
}

/// DemoApp is the application class used for the demo.
class DemoApp extends MyApp {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Show CautionDialog after the build is completed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => const CautionDialog(),
      );
    });

    return super.build(context);
  }
}

/// CautionDialog is the warning dialog displayed in the demo app.
class CautionDialog extends StatelessWidget {
  const CautionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('⚠️ Caution'),
      content: const Text(
        'This is a demo version of the application. '
        'Some functions may not work properly. '
        'For the best experience and full functionality, '
        'please use the official release version.',
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
