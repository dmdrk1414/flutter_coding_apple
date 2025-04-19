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
      //home: Image.asset('assets/test.png')

      // home: Center( // Center() 위젯은 자식 child 위젯의 position을 정가운데로 잡아주는 유용한 위젯일 뿐입니다.
      //     child: Container(width : 50, height : 50, color: Colors.blue)
      // )

      home: Scaffold( // 상중하로 나누어 주는 위젯
        appBar: AppBar(),
        body: Container(),
        bottomNavigationBar: BottomAppBar(
          child: Text('바텀 앱바의 글자쓰기'),
        ),
      ),
    );
  }
}
