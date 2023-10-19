import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
      debugShowCheckedModeBanner: false, //디버그표시 제거
      home: MyApp()
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        floatingActionButton: Builder( //플로팅 버튼 생성
            builder: (context) {
              return FloatingActionButton(child: Icon(Icons.assignment), onPressed: (){ //누르면 수락 환자 목록 뜸
                Navigator.push(context,
                  PageRouteBuilder(
                    pageBuilder: (c, a1, a2) => Accepted(),
                    transitionsBuilder: (c, a1, a2, child) => SlideTransition( //오른쪽에서 왼쪽 슬라이드
                        position: Tween(
                          begin: Offset(-1.0, 0.0),
                          end: Offset(0.0, 0.0)
                        ).animate(a1),
                      child: child
                    ),
                    transitionDuration: Duration(milliseconds : 1000),
                  ),
                );
              }
              );
            }
        ),
        appBar:AppBar(backgroundColor: Colors.black, elevation: 0, //앱바 검은색
          title: Text('EmergenShare', style: TextStyle(fontSize: 40)),
        ),
        body: ListView.builder( //미수락 환자 목록
            itemCount: 6,
            itemBuilder: (c, i){
              return Card(elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  child: Container(
                      height: 150,
                      child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                          children: [ Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text('${i+1}번 환자   나이: ${34-3*i}세', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))
                                ),
                                TextButton(onPressed: (){ //상세 정보 페이지 띄우기
                                  Navigator.push(context,
                                    PageRouteBuilder(
                                      pageBuilder: (c, a1, a2) => Detail(),
                                      transitionsBuilder: (c, a1, a2, child) => FadeTransition(opacity: a1, child: child),
                                      transitionDuration: Duration(milliseconds : 500),
                                    ),
                                  );
                                  }, style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),), //버튼 클릭 애니메이션 제거
                                    child: Icon(Icons.arrow_right_alt, size: 40, color: Colors.black))
                              ]
                          ),
                            SizedBox(height: 50, child: SingleChildScrollView( //환자 증상 태그들
                              scrollDirection: Axis.horizontal,
                              child: Row(
                      children: [
                                Tag('출혈'),
                                Tag('골절'),
                                Tag('절단'),
                                Tag('복통'),
                                Tag('구토'),
                                Tag('어지럼증'),
                                Tag('가려움'),
                                Tag('타박상'),
                                Tag('발작'),
                                Tag('두드러기'),
                                Tag('호흡곤란'),
                                Tag('자상')
                      ]
                              ),
                            ),
                            ),
                            Container(margin: EdgeInsets.fromLTRB(20, 0, 0, 0), child: Color(i))
                          ]
                      )
                  )
              );
            }
            )
    );
  }
}

class Tag extends StatelessWidget {
  final String contents;

  Tag(this.contents);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black12, width: 1), borderRadius: BorderRadius.circular(30)),
      height: 35, margin: EdgeInsets.all(5), padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Text(contents, style: TextStyle(fontWeight: FontWeight.w300))
    );
  }
}
class Color extends StatelessWidget {
  final int a;

  Color(@required this.a);

  @override
  Widget build(BuildContext context) {
    switch(a+1) {
      case 1:
        return Text('KTAS: ${a + 1}단계', style: TextStyle(color: Colors.blue, fontSize: 25, fontWeight: FontWeight.w600));
      case 2:
        return Text('KTAS: ${a + 1}단계', style: TextStyle(color: Colors.red, fontSize: 25, fontWeight: FontWeight.w600));
      case 3:
        return Text('KTAS: ${a + 1}단계', style: TextStyle(color: Colors.yellow, fontSize: 25, fontWeight: FontWeight.w600));
      case 4:
        return Text('KTAS: ${a + 1}단계', style: TextStyle(color: Colors.green, fontSize: 25, fontWeight: FontWeight.w600));
      default:
        return Text('KTAS: 5단계', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600));
    }
  }
}
class Accepted extends StatelessWidget {
  const Accepted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black, elevation: 0, title: Text('')),
      body: ListView.builder(
          itemCount: 6,
          itemBuilder: (c, i){
            return Card(elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                child: Container(
                    height: 150,
                    child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                        children: [ Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  margin: EdgeInsets.all(10),
                                  child: Text('${i+1}번 환자   나이: ${34-3*i}세', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))
                              ),
                              TextButton(onPressed: (){

                              }, style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),),
                                  child: Icon(Icons.arrow_right_alt, size: 40, color: Colors.black))
                            ]
                        ),
                          SizedBox(height: 50, child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                children: [
                                  Tag('출혈'),
                                  Tag('골절'),
                                  Tag('절단'),
                                  Tag('복통'),
                                  Tag('구토'),
                                  Tag('어지럼증'),
                                  Tag('가려움'),
                                  Tag('타박상'),
                                  Tag('발작'),
                                  Tag('두드러기'),
                                  Tag('호흡곤란'),
                                  Tag('자상')
                                ]
                            ),
                          ),
                          ),
                          Container(margin: EdgeInsets.fromLTRB(20, 0, 0, 0), child: Color(i))
                        ]
                    )
                )
            );
          }
      )
    );
  }
}
class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black, elevation: 0, ),
      body: Container()
    );
  }
}



