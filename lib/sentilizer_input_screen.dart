import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sentilizer/sentilizer_output_screen.dart';
import 'package:sentiment_dart/sentiment_dart.dart';

import 'constants.dart';

String inputText;
final sentiment = Sentiment();
Map sentimentOutput;

class SentilizerInputScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Sentilizer', style: kAppbarTextStyle,),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/sentilizerInputScreenBg.gif"),
                fit: BoxFit.cover
            )
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  child: Image.asset('assets/images/home.png'),
                  height: 200,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                  onChanged: (newValue) {
                    inputText = newValue;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white70,
                    filled: true,
                    hintText: 'Type a sentiment to analyze...',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  try{
                    //Sentilizer Calculation
                    sentimentOutput = sentiment.analysis(inputText,emoji: true);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return SentilizerOutputScreen(sentimentOutput: sentimentOutput);
                        }));
                  } catch(e){
                    print(e);
                    Fluttertoast.showToast(
                        msg: "Give a Valid Input!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  }
                },
                child: Text(
                  'Analyze Sentiment',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
