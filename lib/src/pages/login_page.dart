import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:flutterchat/src/widgets/circle_widget.dart';
import 'package:flutterchat/src/widgets/input_text.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    /*Status bar white*/
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;

    return Scaffold(
        body: GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        width: sizes.width,
        height: sizes.height,
        child: Stack(
          children: [
            Circle(
              radius: sizes.width * 0.45,
              radiusSize: 0.35,
              colors: [Colors.white, Colors.greenAccent],
              sizes: sizes,
              right: sizes.width * -0.25,
              top: sizes.width * -.4,
            ),
            Circle(
              radius: sizes.width * 0.35,
              radiusSize: 0.35,
              colors: [Colors.white, Colors.pinkAccent],
              sizes: sizes,
              left: sizes.width * -0.15,
              top: sizes.width * -0.34,
            ),
            SingleChildScrollView(
              child: Container(
                width: sizes.width,
                height: sizes.height,
                margin: EdgeInsets.only(top: sizes.width * .3),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      centralLogo(),
                      form(sizes),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget centralLogo() {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 15)]),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Whats up ! \n Login in',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
        )
      ],
    );
  }

  Widget form(Size sizes) {
    /*We use a ConstrainedBox to limit the size of the button in landscape view or tablets.*/
    final inputs = Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 300, minWidth: 300),
          child: Column(
            children: [
              InputText(
                  label: 'Email',
                  validator: (String text) {
                    print('Validacion de email');
                    if (text.contains('@')) return null;

                    return 'Invalid email';
                  }),
              SizedBox(height: 30),
              InputText(
                inputType: TextInputType.emailAddress,
                label: 'Password ',
                isSecured: true,
                validator: (String text) {
                  if (text.isNotEmpty && text.length > 5) return null;

                  return 'Invalid password';
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 300, minWidth: 300),
          child: CupertinoButton(
            padding: EdgeInsets.symmetric(vertical: 15),
            color: Colors.pinkAccent,
            onPressed: () => _submit(),
            child: Text(
              'Sign in',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
            ),
          ),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You don\'t have an account yet?',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.w300),
            ),
            CupertinoButton(
              borderRadius: BorderRadius.circular(4),
              child: Text(
                'Sign up',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.pinkAccent),
              ),
              onPressed: ()=>Navigator.pushNamed(context, "sing_up"),
            )
          ],
        ),
        SizedBox(
          height: sizes.height * 0.18,
        )
      ],
    );
    return Form(
      key: _formKey,
      child: inputs,
    );
  }

  _submit() {
    _formKey.currentState.validate();
  }
}
