import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // APP의 메인 페이지, 앱을 시작해주세요
}

var VariantTest = SizedBox( child: Text('앱임'), );
var LIST_VIEW_TEXT = SizedBox( child: Text('안녕 LIST 뷰 확인'), );

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

/*  **StatefulWidget**을 사용할 때는 반드시 createState() 메서드를 구현해야 합니다.
    이유는 StatefulWidget은 상태를 가진 위젯을 정의하는 클래스,
    이 상태를 관리할 수 있는 State 객체를 생성해야 하기 때문입니다. */
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

/*  _MyHomePageState는 **State<MyHomePage>**를 상속받는 클래스입니다.
    이 클래스는 MyHomePage 위젯의 상태를 관리합니다. */
class _MyHomePageState extends State<MyHomePage> {
  /* _selectedIndex는 하단 내비게이션 바에서 선택된 아이템의 인덱스를 저장하는 상태 변수입니다. */
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    /* _MyHomePageState는 State<MyHomePage>를 상속받는 상태 관리 클래스이며
      상태가 변경될 때마다 UI를 다시 그리기 위해
      setState() 메서드를 호출합니다 */
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
        title: VariantTest,
      ),
      body: Row(
        children: [ // %으로 만들기
          Flexible(
            flex: 5,
            child: Container(
              color: Colors.blue,
              child: ListView.builder(
                itemCount: 1000, // 반복할 항목의 개수를 지정합니다. 여기서는 1000으로 설정했습니다.
                /*  itemBuilder 각 항목을 그릴 때 호출되는 콜백 함수입니다.
                    index는 항목의 인덱스를 나타냅니다.
                    이를 통해 각 ListTile의 내용을 동적으로 생성할 수 있습니다. */
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Item #${index + 1}'), // 아이템 번호
                  );
                },
              ),
            ),
          ),
          Flexible( flex: 5, child: Container(color: Colors.red,), ),
          Flexible( flex: 5, child: Container(color: Colors.green,), ),
        ],
      ),

      bottomNavigationBar: MyCustomBottomNavigationBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped
      )
    );
  }
}

// 커스텀 BottomNavigationBar 위젯
class MyCustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;   // 부모에서 전달받은 선택된 인덱스
  final ValueChanged<int> onItemTapped; // 아이템을 탭했을 때 호출되는 콜백 함수

  // 생성자: 부모에서 selectedIndex와 onItemTapped를 전달받음
  const MyCustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,  // 선택된 인덱스
    required this.onItemTapped,   // 탭 시 호출할 함수
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,  // 현재 선택된 아이템을 표시
      onTap: onItemTapped,          // 아이템 탭 시 호출되는 함수
      items: const <BottomNavigationBarItem>[
        // 내비게이션 아이템들
        BottomNavigationBarItem(
          icon: Icon(Icons.phone),  // 아이콘 설정
          label: '전화',             // 라벨 설정
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message), // 아이콘 설정
          label: '메시지',            // 라벨 설정
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.lock),    // 아이콘 설정
          label: '잠금',              // 라벨 설정
        ),
      ],
    );
  }
}