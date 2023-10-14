import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.reorder)),
        appBar: AppBar(
          title: Text('EmergenShare'),
          backgroundColor: Colors.black
        ),
        body: ListView.builder(
            itemCount: 4,
            itemBuilder: (c, i){
              return Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black, width: 3))
                ),
                height: 200,
                child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${i+1}번환자', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  SizedBox(height: 50, child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Tag('출혈'),
                        Tag('출혈'),
                        Tag('출혈'),
                        Tag('출혈'),
                        Tag('출혈'),
                        Tag('출혈'),
                        Tag('출혈'),
                        Tag('출혈'),
                        Tag('출혈'),
                        Tag('출혈'),
                        Tag('출혈'),
                        Tag('자상')
                      ]
                    ),
                  ),
                  )
                ]
                )
              );
            }
        )
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
