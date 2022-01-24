// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shamo_front_end/pages/cart_page.dart';
import 'package:shamo_front_end/pages/checkout_page.dart';
import 'package:shamo_front_end/pages/checkout_success_page.dart';
import 'package:shamo_front_end/pages/edit_profile_page.dart';
import 'package:shamo_front_end/pages/home/main_page.dart';
import 'package:shamo_front_end/pages/product_page.dart';

import 'package:shamo_front_end/pages/sign_in_page.dart';
import 'package:shamo_front_end/pages/sign_up_page.dart';
import 'package:shamo_front_end/pages/splash_page.dart';
import 'package:shamo_front_end/theme.dart';
import 'package:shamo_front_end/pages/detail_chat_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/home': (context) => MainPage(),
        '/detail-chat': (context) => DetailChatPage(),
        '/edit-profile': (context) => EditProfilePage(),
        '/product': (context) => ProductPage(),
        '/cart': (context) => CartPage(),
        '/checkout': (context) => CheckoutPage(),
        '/checkout-success': (context) => CheckoutSuccessPage(),
      },
    );
  }
}
