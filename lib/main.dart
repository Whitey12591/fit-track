import 'package:flutter/material.dart';
import 'WorkoutSet.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Fit Track'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.test}) : super(key: key);

  final String title;
  final String test;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  WorkoutSet _currentSet = new WorkoutSet();

  _completeSet(WorkoutSet completed) {
    setState(() {
      _currentSet = completed;
    });
    debugger();
    print(_currentSet);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    WorkoutSet localWorkout;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Enter Workout/Lift'),
              onChanged: (text) {
                localWorkout.lift = text;
              },
            ),
            TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Enter Weight'),
              onChanged: (text) {
                localWorkout.weight = text;
              },
            ),
            TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Enter Reps'),
              onChanged: (text) {
                localWorkout.reps = text;
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _completeSet(localWorkout);
        },
        tooltip: 'Complete Set',
        child: Icon(Icons.navigate_next),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
