import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';

// flutter build apk --split-per-abi 앱 만들기
// /build/app/outputs/apk/release/app-armeabi-v7a-release.apk
// 새로운거 얌에 설치하면 디버깅 완전히 재실행 필요

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
