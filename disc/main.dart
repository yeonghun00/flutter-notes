import 'package:flutter/material.dart';
import 'package:toonflix/pages/first.dart';

// flutter build apk --split-per-abi 앱 만들기
// /build/app/outputs/apk/release/app-armeabi-v7a-release.apk

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 키보드에서 손 떼면 키보드 사라짐
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFF2F4F8),
        ),
        home: const HomePage(),
      ),
    );
  }
}
