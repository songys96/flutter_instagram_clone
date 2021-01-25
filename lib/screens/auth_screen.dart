import 'package:flutter/material.dart';
import 'package:flutter_app/constants/durations.dart';
import 'package:flutter_app/widgets/sign_in_form.dart';
import 'package:flutter_app/widgets/sign_up_form.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  Widget signUpForm = SignUpForm();
  Widget signInForm = SignInForm();
  Widget currentWidget;

  @override
  void initState() {
    if(currentWidget == null)
      Widget currentWidget  = signInForm;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedSwitcher(
              child: currentWidget,
              duration: duration3,),
            Container(
              child: FlatButton(
                  onPressed: (){
                    setState(() {
                      if (currentWidget is SignUpForm)
                        currentWidget = signInForm;
                      else
                        currentWidget = signUpForm;
                    });
                  },
                  child: Text("Sign")),
            ),
          ],
        ),
      ),
    );
  }
}
