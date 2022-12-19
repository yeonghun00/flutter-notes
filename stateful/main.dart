import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      // UI 업데이트
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // UI 통일
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.amber),
        ),
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text(''),
              IconButton(
                  onPressed: toggleTitle,
                  icon: const Icon(Icons.remove_red_eye))
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    Key? key,
  }) : super(key: key);

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  void initState() {
    // 초기에 한번만 실행됨
    // 위젯 라이프사이클
    print('start');
    super.initState();
  }

  @override
  void dispose() {
    print('dispose');
    // 끝날때 한번만 실행됨
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Text(
      "My Large Title",
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
        // 다른 클라쓰 부모 접근 (라인26, theme)
      ),
    );
  }
}
