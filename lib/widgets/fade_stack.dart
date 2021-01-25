import 'package:flutter/material.dart';
import 'package:flutter_app/constants/durations.dart';
import 'package:flutter_app/widgets/sign_in_form.dart';
import 'package:flutter_app/widgets/sign_up_form.dart';

class FadeStack extends StatefulWidget {
  final int selectedForm;

  const FadeStack({Key key, this.selectedForm}) : super(key: key);
  @override
  _FadeStackState createState() => _FadeStackState();
}

class _FadeStackState extends State<FadeStack> with SingleTickerProviderStateMixin {

  List<Widget> forms = [SignInForm(), SignUpForm()];
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: duration3);
    _animationController.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FadeStack oldWidget) {
    if (widget.selectedForm != oldWidget.selectedForm)
      _animationController.forward(from: 0.0);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController,
      child: IndexedStack(
        index: widget.selectedForm,
        children: forms,
      ),
    );
  }
}
