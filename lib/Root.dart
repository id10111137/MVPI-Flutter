import 'package:flutter/material.dart';
import 'package:login/Activity/HomeActivity.dart';
import 'package:login/Activity/LoginActivity.dart';

final routes = {
  '/login':         (BuildContext context) => new LoginActivity(),
  '/homePage':         (BuildContext context) => new HomeActivity(),
  '/' :          (BuildContext context) => new LoginActivity(),
};
