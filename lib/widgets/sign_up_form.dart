import 'package:flutter/material.dart';
import 'package:flutter_app/constants/common_size.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          SizedBox(height: common_l_gap,),
          Image.asset("assets/images/insta_text_logo.png"),
          Padding(
            padding: const EdgeInsets.all(common_gap),
            child: TextFormField(
              controller: _emailController,
              validator: (text){
                if (text.isNotEmpty && text.contains("@"))
                  return null;
                else
                  return "Check your Email address";
              },
              decoration: InputDecoration(
                hintText: "Email",
                filled: true,
                fillColor: Colors.grey[100],
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(common_s_gap)
                )
              )
            ),

          ),
          TextFormField(),
          TextFormField(),
        ],
      ),
    );
  }
}
