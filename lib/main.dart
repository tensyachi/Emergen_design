import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp()
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        floatingActionButton: Builder(
            builder: (context) {
              return FloatingActionButton(child: Icon(Icons.reorder), onPressed: (){
                showModalBottomSheet(context: context,
                  builder: (context){
                  return Column(
                    children: [
                      Flexible(
                          child: Container(height: 250,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                          ),
                      )
                      ),
                      Flexible(flex: 1,
                          child: Container(decoration: BoxDecoration(color: Colors.white),
                            child: Column(children: [
                              ListTile(
                                  contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 0),
                                  horizontalTitleGap: 25,
                                  textColor: Colors.black,
                                  iconColor: Colors.black,
                                  leading: Icon(Icons.assignment, size: 40),
                                  title: Text('수락 환자 목록', style: TextStyle(fontSize: 20),),
                                onTap: (){
                                  Navigator.push(context,
                                    PageRouteBuilder(
                                      pageBuilder: (c, a1, a2) => Accepted(),
                                      transitionsBuilder: (c, a1, a2, child) => FadeTransition(opacity: a1, child: child),
                                      transitionDuration: Duration(milliseconds : 500),
                                    ),
                                  );
                                },
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 0),
                                horizontalTitleGap: 25,
                                textColor: Colors.black,
                                iconColor: Colors.black,
                                leading: Icon(Icons.settings, size: 40),
                                title: Text('설정', style: TextStyle(fontSize: 20),),
                                onTap: (){
                                  Navigator.push(context,
                                    PageRouteBuilder(
                                      pageBuilder: (c, a1, a2) => Accepted(),
                                      transitionsBuilder: (c, a1, a2, child) => FadeTransition(opacity: a1, child: child),
                                      transitionDuration: Duration(milliseconds : 500),
                                    ),
                                  );
                                },
                              )
                            ]
                            )
                          )
                      )
                    ],
                  );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                  ),
                  constraints: const BoxConstraints(
                      minHeight: 100,
                      maxHeight: 700
                  ),
                  enableDrag: true,
                  isScrollControlled: true,
                );
              }
              );
            }
            ),
        appBar:AppBar(backgroundColor: Colors.black, elevation: 0,
          title: Text('EmergenShare', style: TextStyle(fontSize: 40)),
        ),
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (c, i){
              return Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black, width: 3))
                ),
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
        return Text('KTAS: ${a + 1}단계', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600));
    }
  }
}
class Accepted extends StatelessWidget {
  const Accepted({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


