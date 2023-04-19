import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

import 'package:get/get.dart';
import 'package:qr_qode/app/modules/home/views/home_view.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLogin(
        title: 'LOGIN',
        onLogin: controller.authUser,
        onSignup: controller.signupUser,
        onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomeView(),
          ));
        },
        onRecoverPassword: controller.recoverPassword,
      ),
    );
  }
}
