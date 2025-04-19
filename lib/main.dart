import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // APP의 메인 페이지, 앱을 시작해주세요
}

// 메인 페이지
class MyApp extends StatelessWidget {
  const MyApp({super.key});  // 기본적으로 들어가는 코드
  @override // 기본적으로 들어가는 코드
  Widget build(BuildContext context) { // 기본적으로 들어가는 코드

    return  MaterialApp(
      // home: Text('안녕'),
      //home: Icon(Icons.shop), // 아이콘 위젯
    );
  }
}
