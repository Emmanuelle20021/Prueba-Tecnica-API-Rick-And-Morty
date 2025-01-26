import 'package:flutter/cupertino.dart';

void main() {
  runApp(
    RootWidget(),
  );
}

class RootWidget extends StatelessWidget {
  const RootWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Hello, World!'),
        ),
        child: Center(
          child: Text('Hello, World!'),
        ),
      ),
    );
  }
}
