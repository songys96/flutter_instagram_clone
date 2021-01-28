import 'package:flutter/material.dart';
import 'package:flutter_app/constants/common_size.dart';
import 'package:flutter_app/home.dart';

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
                  decoration: _textInputDecor("Email")),
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
                  decoration: _textInputDecor("Password")),
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
                  decoration: _textInputDecor("Confirm Password")),
              SizedBox(
                height: common_xs_gap,
              ),
              FlatButton(
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
              ),
              SizedBox(height: common_gap,),
              Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0, right: 0, height: 1,
                    child: Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    height: 3,
                    width: 40,
                    color: Colors.grey[50],
                  ),
                  Text("OR", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _textInputDecor(String hintText) {
    return InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[100],
        enabledBorder: _activeInputBorder(),
        focusedBorder: _activeInputBorder(),
        errorBorder: _errorInputBorder(),
        focusedErrorBorder: _errorInputBorder());
  }

  OutlineInputBorder _activeInputBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(common_s_gap));
  }
  OutlineInputBorder _errorInputBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent),
        borderRadius: BorderRadius.circular(common_s_gap));
  }

}
