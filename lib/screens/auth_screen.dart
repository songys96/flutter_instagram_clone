import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/fade_stack.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin{
  int selectedForm = 0; //SignIn Form

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FadeStack(selectedForm: selectedForm,),
            Positioned(
              left: 0, right: 0, bottom: 0, height: 40,
              child: Container(
                child: FlatButton(
                  color: Colors.white,
                    shape: Border(top: BorderSide(color: Colors.grey)),
                    onPressed: (){
                      setState(() {
                        if (selectedForm == 0)
                          selectedForm = 1;
                        else
                          selectedForm = 0;
                      });
                    },
                    child: RichText(
                      text: TextSpan(
                        text: (selectedForm == 0)?"Don't have an account? ":"Already have an account? ",
                        style: TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(
                            text: (selectedForm == 0)?"Sign Up":"Sign In",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold
                            )
                          )
                        ]
                      )
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
