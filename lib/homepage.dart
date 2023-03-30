import 'package:firstcodelab/myfavoritepage.dart';
import 'package:firstcodelab/mygenerator.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const MyGenerator();
        break;
      case 1:
        page = const MyFavouritePage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
                child: NavigationRail(
              extended: constraints.maxWidth >= 600,
              selectedIndex: selectedIndex,
              onDestinationSelected: ((value) {
                setState(() {
                  selectedIndex = value;
                });
              }),
              destinations: const [
                NavigationRailDestination(
                    icon: Icon(Icons.home), label: Text('Home')),
                NavigationRailDestination(
                    icon: Icon(Icons.favorite), label: Text('Favorite'))
              ],
            )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).primaryColor,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}
