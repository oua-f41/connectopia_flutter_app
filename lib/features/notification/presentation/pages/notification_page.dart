import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

@RoutePage()
class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("You have no notifications.",
            style: context.textTheme.titleLarge),
      ),
    );
  }
}
