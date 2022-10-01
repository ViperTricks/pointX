import 'package:flutter/material.dart';
import './models/city.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  final List<City> cities = const <City>[
    City('Hanoi',
        'https://vietnam.travel/sites/default/files/styles/top_banner/public/2017-07/vietnam-tourism-4.jpg?itok=pn9rKMK7'),
    City('HCM',
        'https://a.cdn-hotels.com/gdcs/production144/d1394/a304783d-6dc9-4bb2-9239-d124a16a154e.jpg?impolicy=fcrop&w=1600&h=1066&q=medium')
  ];

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GridView.builder(
        itemCount: widget.cities.length,
        itemBuilder: (context, index) {
          return Container(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
              child: Stack(children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(widget.cities[index].imageUrl),
                    fit: BoxFit.fill,
                  )),
                  constraints: BoxConstraints.expand(),
                ),
                Container(
                  child: Text(""),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: <Color>[
                        Color.fromRGBO(0, 0, 0, 0.7),
                        Color.fromRGBO(255, 255, 255, 0.5),
                        Color.fromRGBO(255, 255, 255, 0),
                        Color.fromRGBO(255, 255, 255, 0),
                      ], // Gradient from https://learnui.design/tools/gradient-generator.html
                      tileMode: TileMode.mirror,
                    ),
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  // width: ,
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.cities[index].name,
                          style: TextStyle(fontSize: 50, color: Colors.white),
                        ))),
              ]),
              //   Center(
              //       child: Container(
              //           color: Colors.red,
              //           padding: const EdgeInsets.all(8.0),
              //           child: Text(widget.cities[index].name)))
              // ]),
            ),
          );
        },
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      )),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
