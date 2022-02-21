import 'package:flutter/material.dart';
import 'package:gerencia_de_estado_pura/setState/imc_setstate_page.dart';
import 'package:gerencia_de_estado_pura/value_notifier/imc_value_notifier_page.dart';

import 'bloc_pattern/imc_bloc_pattern_page.dart';
import 'change_notifier/imc_change_notifier_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _gotToPage(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return page;
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _gotToPage(context, ImcSetstatePage());
              },
              child: Text('SetState'),
            ),
            ElevatedButton(
              onPressed: () {
                _gotToPage(context, ValueNotifierPage());
              },
              child: Text('ValueNotifier'),
            ),
            ElevatedButton(
              onPressed: () {
                _gotToPage(context, ChangeNotifierPage());
              },
              child: Text('ChangeNotifier'),
            ),
            ElevatedButton(
              onPressed: () {
                _gotToPage(context, ImcBlocPatternPage());
              },
              child: Text('Bloc Pattern'),
            )
          ],
        ),
      ),
    );
  }
}
