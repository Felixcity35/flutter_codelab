import 'package:firstcodelab/dataprovider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class MyFavouritePage extends StatelessWidget {
  const MyFavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    var myState = context.watch<DataProvider>();
    var myFavourite = myState.favourite;
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Favourite'),
        ),
        body: ListView.builder(
            itemCount: myFavourite.length,
            itemBuilder: ((context, index) {
              return ListTile(
                leading: const Icon(Icons.favorite),
                title: Text(myFavourite[index].asSnakeCase),
              );
            })));
  }
}
