import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:sentilizer/about_screen.dart';

import 'constants.dart';

class SentilizerOutputScreen extends StatelessWidget {
  final Map sentimentOutput;

  SentilizerOutputScreen({@required this.sentimentOutput});

  String get emojiOutput {
    if (sentimentOutput['score'] > 0) {
      return "assets/images/happy.png";
    } else if ((sentimentOutput['score'] < 0)) {
      return "assets/images/sad.png";
    } else {
      return "assets/images/neutral.png";
    }
  }

  String get bgOutput {
    if (sentimentOutput['score'] > 0) {
      return "assets/images/happyBg.png";
    } else if ((sentimentOutput['score'] < 0)) {
      return "assets/images/sadBg.png";
    } else {
      return "assets/images/neutralBg.png";
    }
  }

  String get sentilizerOutput {
    if (sentimentOutput['score'] > 0) {
      return "Positive";
    } else if ((sentimentOutput['score'] < 0)) {
      return "Negative";
    } else {
      return "Neutral";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Sentiment Analyzed',
          style: kAppbarTextStyle.copyWith(
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(bgOutput), fit: BoxFit.cover)),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TypewriterAnimatedTextKit(
                    text: ["Predicted sentiment is $sentilizerOutput"],
                    speed: Duration(milliseconds: 50),
                    isRepeatingAnimation: false,
                    textStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: Stack(
                      fit: StackFit.expand,
                      overflow: Overflow.visible,
                      children: [
                        Hero(
                          tag: 'logo',
                          child: Container(
                            child: Image.asset(emojiOutput),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Score",
                    style: kBodyTextStyle,
                  ),
                  Text(
                    sentimentOutput['score'].toString(),
                    style: TextStyle(color: Colors.black87),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Words",
                    style: kBodyTextStyle,
                  ),
                  Text(
                    sentimentOutput['words'].toString(),
                    style: TextStyle(color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Good Words",
                    style: kBodyTextStyle,
                  ),
                  Text(
                    sentimentOutput['good words'].toString(),
                    style: TextStyle(color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Bad Words",
                    style: kBodyTextStyle,
                  ),
                  Text(
                    sentimentOutput['badword'].toString(),
                    style: TextStyle(color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AboutScreen();
                      }));
                    },
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: Colors.black87),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'About us',
                        style: kAboutButtonTextStyle,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
