import 'package:english_words/english_words.dart';
import 'package:firstcodelab/dataprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyGenerator extends StatelessWidget {
  const MyGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    var myState = context.watch<DataProvider>();
    var data = myState.wordRan;
    IconData icon;
    if (myState.favourite.contains(data)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigCard(data: data),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  onPressed: (() {
                    myState.toggleFavourite();
                  }),
                  icon: Icon(icon),
                  label: const Text('Like'),
                ),
                const SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                    onPressed: (() {
                      myState.getNext();
                    }),
                    child: const Text('Next')),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final WordPair data;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          data.asSnakeCase,
          style: style,
        ),
      ),
    );
  }
}
