import 'package:flutter/material.dart';
import 'package:flutter_app/constants/auth_input_decor.dart';
import 'package:flutter_app/constants/common_size.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/widgets/or_divider.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  TextEditingController _cpwController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(common_l_gap),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                height: common_l_gap,
              ),
              Image.asset("assets/images/insta_text_logo.png"),
              TextFormField(
                  cursorColor: Colors.black87,
                  controller: _emailController,
                  validator: (text) {
                    if (text.isNotEmpty && text.contains("@"))
                      return null;
                    else
                      return "Check your Email address";
                  },
                  decoration: textInputDecor("Email")),
              SizedBox(
                height: common_xs_gap,
              ),
              TextFormField(
                  cursorColor: Colors.black87,
                  obscureText: true,
                  controller: _pwController,
                  validator: (text) {
                    if (text.isNotEmpty)
                      return null;
                    else
                      return "비밀번호가 비어있습니다.";
                  },
                  decoration: textInputDecor("Password")),
              SizedBox(
                height: common_xs_gap,
              ),
              TextFormField(
                  cursorColor: Colors.black87,
                  obscureText: true,
                  controller: _cpwController,
                  validator: (text) {
                    if (text.isNotEmpty && _pwController.text == text)
                      return null;
                    else
                      return "입력한 값이 일치하지 않습니다";
                  },
                  decoration: textInputDecor("Confirm Password")),
              FlatButton(
                  onPressed: (){},
                  child: Align(
                    child: Text("forgot your password?"),
                    alignment: Alignment.centerRight,
                  )),
              _submitButton(context),
              SizedBox(height: common_gap,),
              OrDivider(),
              SizedBox(height: common_gap,),
              FlatButton.icon(
                  onPressed: (){},
                  textColor: Colors.blue,
                  icon: ImageIcon(AssetImage("assets/images/facebook.png")),
                  label: Text("Login with Facebook"))
            ],
          ),
        ),
      ),
    );
  }

  FlatButton _submitButton(BuildContext context) {
    return FlatButton(
                onPressed: () {
                  _formKey.currentState.validate();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context)=>HomePage())
                  );
                },
                color: Colors.blue,
                child: Text(
                  "join",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )
            );
  }


}

