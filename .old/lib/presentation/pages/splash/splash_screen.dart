import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fsm_flutter/core/constants.dart';
import 'package:fsm_flutter/injection.dart';
import 'package:fsm_flutter/presentation/pages/fsm_dashboard/fsm_dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/resources/image_resources.dart';
import '../login/login_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with TickerProviderStateMixin {
  late SharedPreferences sharedPreferences;
  Timer? _timer;
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;
  String companyName = "";

  startDelay() {
    _timer = Timer(const Duration(seconds: 2), getInitialScreens);
  }

  getInitialScreens() async {
    sharedPreferences = serviceLocator<SharedPreferences>();
    final accessToken = sharedPreferences.getString(AppConstants.accessToken);
    if (kDebugMode) {
      print("Access Token: $accessToken");
    }
    final hasToken =
        sharedPreferences.getString(AppConstants.accessToken) != null;
    if (!hasToken) {
      if (!mounted) return;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => FSMDashboardPage()),
          (route) => false);
    }
  }

  @override
  void initState() {
    startDelay();
    _controller1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    )..repeat(reverse: true);

    _controller2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true, period: Duration(milliseconds: 375));

    _controller3 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true, period: Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.fsmLogo,
              height: 250,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoadingCircles(controller: _controller1),
                LoadingCircles(controller: _controller2),
                LoadingCircles(controller: _controller3),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingCircles extends StatelessWidget {
  const LoadingCircles({
    super.key,
    required AnimationController controller,
  }) : _controller = controller;

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: (20),
          height: (20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: (8),
          ),
          transform: Matrix4.translationValues(0, _controller.value * 10, 0),
        );
      },
    );
  }
}
