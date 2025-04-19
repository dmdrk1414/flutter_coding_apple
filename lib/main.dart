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

      /* APP BAR 꾸미는 방법 */
      appBar: AppBar(
        leading: Icon(Icons.star), // 앱 왼쪽 위에
        actions: [ // 앱 오른쪽 위에
          Icon(Icons.star),
          Icon(Icons.star)
        ],
        backgroundColor: Colors.blue,
        title: Text('앱임'),
      ),
      body: Row(
        children: [ // %으로 만들기
          Flexible( flex: 5, child: Container(color: Colors.blue,), ),
          Flexible( flex: 5, child: Container(color: Colors.red,), ),
          Flexible( flex: 5, child: Container(color: Colors.green,), )
        ],
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