import 'package:akshit/project/routes/app_route_consts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          const Center(
            child: Text('Home'),
          ),
          ElevatedButton(
              onPressed: () {
                GoRouter.of(context).pushNamed(MyAppConstants.aboutRouteName);
              },
              child: const Text('Go to About')),
          ElevatedButton(
              onPressed: () {
                GoRouter.of(context).pushNamed(MyAppConstants.profileRouteName);
              },
              child: const Text('Go to profile')),
          ElevatedButton(
              onPressed: () {
                GoRouter.of(context).pushNamed(MyAppConstants.contactRouteName);
              },
              child: const Text('Go to contact')),
        ],
      ),
    );
  }
}
