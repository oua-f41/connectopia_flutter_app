import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:f41/app/student_app.dart';
import 'package:f41/app/student_app_cubit.dart';

import '../../../app/app_router.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("title"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                context.read<StudentAppCubit>().changeTheme();
              },
              icon: const Icon(Icons.dark_mode))
        ],
      ),
      drawer: const _MainDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  context.router.push(const OnboardRoute());
                },
                child: const Text("onboard")),
            TextButton(
                onPressed: () {
                  context.router.push(const DenemeRoute());
                },
                child: const Text("deneme"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<StudentAppCubit>().changeLocale(LocaleKeys.tr);
      }),
    );
  }
}

class _MainDrawer extends StatelessWidget {
  const _MainDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
