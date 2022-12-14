import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/counter_provider.dart';

/* to use provider package
  1. ChangeNotifier
  2. ChangeNotifierProvider
  3. consumer
 */

class CounterScreen extends StatelessWidget {
  final String title;
  const CounterScreen({super.key, required this.title});

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            CounterText(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ctx.read<Counter>().increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext ctx) {
    return Consumer<Counter>(
      builder: (ctx, data, child) {
        return Text(
          '${data.count}',
          style: Theme.of(ctx).textTheme.headline4,
        );
      },
    );
  }
}

/* 
  without Consumer widget
 */
// class CounterText extends StatelessWidget {
//   const CounterText({super.key});

//   @override
//   Widget build(BuildContext ctx) {
//     int count = ctx.watch<Counter>().count;

//     return Text(
//       '$count',
//       style: Theme.of(ctx).textTheme.headline4,
//     );
//   }
// }
