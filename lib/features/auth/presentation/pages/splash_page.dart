import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/di/injection.dart';
import '../blocs/auth/auth_bloc.dart';
import '../blocs/auth/auth_event.dart';
import '../blocs/auth/auth_state.dart';
import '../widgets/loading_circles.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with TickerProviderStateMixin {
  Timer? _timer;
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startDelay();
  }

  void _initializeAnimations() {
    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    )..repeat(reverse: true);

    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true, period: const Duration(milliseconds: 375));

    _controller3 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true, period: const Duration(milliseconds: 500));
  }

  void _startDelay() {
    _timer = Timer(const Duration(seconds: 2), () {
      context.read<AuthBloc>().add(const AuthEvent.checkAuth());
    });
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
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            loading: () {},
            authenticated: (user) {
              if (user.isTechnician) {
                context.router.navigateNamed('/main');
              } else {
                // Show error for non-technician users
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please use web portal for authentication.'),
                    backgroundColor: Colors.blue,
                  ),
                );
                context.router.navigateNamed('/login');
              }
            },
            unauthenticated: () {
              context.router.navigateNamed('/login');
            },
            error: (message) {
              context.router.navigateNamed('/login');
            },
          );
        },
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/fsm_logo.png',
                  height: 250.h,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 15.h),
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
        ),
      ),
    );
  }
}