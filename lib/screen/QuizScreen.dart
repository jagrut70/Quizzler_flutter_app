import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzler_app/components/Constants.dart';
import '../components/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();
class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Quizpage();
  }
}
class Quizpage extends StatefulWidget {
  const Quizpage({Key? key}) : super(key: key);

  @override
  _QuizpageState createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  List<Icon> scorekeeper =
  [

  ];
  int qNum = 1;
  void checkAnswer(bool userPickedAnswer){
    bool correctanswer = quizBrain.getCorrectAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        qNum = 1;
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        quizBrain.reset();

        //TODO Step 4 Part D - empty out the scoreKeeper.
        scorekeeper = [];
      }
      else
        {
          if(userPickedAnswer == correctanswer)
          {
            scorekeeper.add(Icon(Icons.check, color: Colors.green,));
            qNum++;
          }
          else
          {
            scorekeeper.add(Icon(Icons.close, color: Colors.red));
            qNum++;
          }
          setState(() {
            quizBrain.nextQuestion();
          });
        }
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFF3A4473),
      //backgroundColor: Color(0xFF000022),
      backgroundColor: Color(0xFF1e1d34),
      body: SafeArea(
      child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: kDefaultPadding,),
          Text.rich(
            TextSpan(
            text: "Question $qNum",
            style: Theme.of(context).textTheme.headline4!.copyWith(color: kSecondaryColor),
          ),

          ),

          Center(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage
                  (
                  fit: BoxFit.cover,
                  image: AssetImage('images/display.png'),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              // ignore: deprecated_member_use
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.green,
                child: Text(
                  'True',
                  style: TextStyle(
                    fontSize: 17,
                    letterSpacing: 0.2,
                  ),
                ),
                onPressed: () {
                  checkAnswer(true);
                },
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              // ignore: deprecated_member_use
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.red,
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 17,
                    letterSpacing: 0.2,
                  ),
                ),
                onPressed: () {
                  checkAnswer(false);
                },
              ),
            ),
          ),

          Row(
            children: scorekeeper,
          ),
        ],
      ),
    ),
      ),
    );
  }
}
