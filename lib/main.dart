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
      body: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // 수평 중앙 정렬
          children: [
            /* Text 꾸미는 법 */
            Text(
              '안녕하세요',
              style: TextStyle(
                color: Colors.red, // 텍스트 색상 설정
                fontWeight: FontWeight.w600, // 텍스트 두께 설정
                fontSize: 30, // 텍스트 크기 설정
                // color: Color.fromRGBO(r, g, b, opacity) // RGB를 이용하여 색감 입히기
              ),
            ),
            SizedBox(width: 10), // 텍스트와 아이콘 사이의 간격 설정

          ],
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