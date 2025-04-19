import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // APP의 메인 페이지, 앱을 시작해주세요
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 배너 숨기기
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('앱임'),
        backgroundColor: Colors.blue,
      ),
      body: Align( // 하단 정렬하는 방법
        alignment: Alignment.bottomCenter,
        child: Container( // Container 데코레이션 하는 방법
          width: double.infinity, // 가로로 꽉 체우기
          height: 100,
          padding: EdgeInsets.all(20), // 페딩 하는 방법

          decoration: BoxDecoration( // Container 색, 디자인
            border: Border.all(color: Colors.black),
            color: Colors.blue
          ),

          child: Text('ads'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: '전화',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: '메시지',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock),
            label: '잠금',
          ),
        ],
      ),
    );
  }
}