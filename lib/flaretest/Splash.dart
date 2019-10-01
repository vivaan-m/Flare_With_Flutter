import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/material.dart';
import 'package:libtest/Colors.dart';

class Splash extends StatefulWidget {
  static const String routeName = "/Splash";

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool ispaused = false;

  int selected = 0;

  List<String> animationItems = ["assets/animations/loading.flr","assets/animations/Bob.flr","assets/animations/Bob.flr","assets/animations/Bob.flr","assets/animations/forked-learning.flr"];
  List<String> animate = ["animate","Wave","Dance","Jump","Alarm"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: black(),title: Text("Flare Animation Wth Flutter",style: TextStyle(color: white()),),),
      backgroundColor: black(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              width: screenWidth(context),
              height: screenHeight(context) / 2,
              child: FlareActor(
                animationItems[selected],
                isPaused: ispaused,
                animation: animate[selected],
              ),
            ),
            SizedBox(
              height: 200,
            ),
            button(context,
                title: Text(ispaused ? "Play" : "Pause",
                    style:
                        TextStyle(color: white(), fontWeight: FontWeight.w500)),
                onTap: () {
              setState(() {
                ispaused = !ispaused;
              });
            }),
            Row(children: <Widget>[
              Expanded(
                  child: button(context,
                      title: Text(
                        "Previous Animation",
                        style: TextStyle(color: white()),
                      ), onTap: () {
                setState(() {
                  selected = selected == 0 ? selected : selected - 1;
                });
              })),
              Expanded(
                child: button(context,
                    title: Text(
                      "Next Animation",
                      style: TextStyle(color: white()),
                    ), onTap: () {
                  setState(() {
                    selected = selected == 4 ? selected : selected + 1;
                  });
                }),
              )
            ])
          ],
        ),
      ),
    );
  }
}
