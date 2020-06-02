import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/components/horizontalButton.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      //upperBound: 100.0,
    );

    //animation = CurvedAnimation(parent: controller , curve: Curves.elasticOut);

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);

    controller.forward();
    //controller.reverse(from: 1.0);

    //To infinete loop untile dispose
    // animation.addStatusListener((status) {
    //   //print(status);
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   }else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });

    controller.addListener(() {
      setState(() {}); //to controller value setting to state
      //print(controller.value);
      //print(animation.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation
          .value, //backgroundColor: Colors.red.withOpacity(controller.value),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                      child: Image.asset('images/logo.png'),
                      height: 60.0 //animation.value*100,//controller.value,
                      ),
                ),
                TyperAnimatedTextKit(
                  speed: Duration(milliseconds: 100),
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            HorizontalButton(
              color: Colors.lightBlueAccent,
              buttonText: "Log In",
              onPress: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            HorizontalButton(
              color: Colors.blueAccent,
              buttonText: "Register",
              onPress: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
