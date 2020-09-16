import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'appFunc.dart';
import 'QnA.dart';

AppFunc obj = AppFunc();
void main() {
  runApp(Quiz());
}

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text("QNA APP"),
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: QnAapp(),
          ),
        ),
      ),
    );
  }
}

class QnAapp extends StatefulWidget {
  @override
  _QnAappState createState() => _QnAappState();
}

class _QnAappState extends State<QnAapp> {
  List<Widget> score = [];
  int total = 0;
  void check(bool ans) {
    bool correctAns = obj.getAnswer();
    setState(() {
      if (ans == correctAns) {
        total += 1;
      }
      if (obj.isOver() == true) {
        Alert(
          context: context,
          title: 'Done!',
          desc:
              "You've reached the end of the quiz.\nYour Final Score is $total/3",
        ).show();
        obj.reset();
        score = [];
        total = 0;
      } else {
        if (ans == correctAns) {
          score.add(Icon(
            Icons.check,
            color: Colors.lightGreen,
          ));
        } else {
          score.add(
            Icon(
              Icons.close,
              color: Colors.redAccent,
            ),
          );
        }
        obj.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                obj.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              onPressed: () {
                check(true);
              },
              color: Colors.green,
              child: Text(
                "True",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(40.0)),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              onPressed: () {
                check(false);
              },
              color: Colors.red,
              child: Text(
                "False",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(40.0)),
            ),
          ),
        ),
        Row(
          children: score,
        )
      ],
    );
  }
}
