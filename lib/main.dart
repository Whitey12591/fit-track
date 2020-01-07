import 'package:fit_track/theme/style.dart';
import 'package:flutter/material.dart';
import 'models/WorkoutSet.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme(),
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
    print(_currentSet);
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
