import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:reactive_forms/reactive_forms.dart';
import '../../../../core/di/injection.dart';


import '../blocs/auth/auth_bloc.dart';
import '../blocs/auth/auth_event.dart';
import '../blocs/auth/auth_state.dart';
import '../widgets/gradient_elevated_button.dart';
import '../widgets/login_form.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late FormGroup _formGroup;

  @override
  void initState() {
    super.initState();
    _initializeForm();
  }

  void _initializeForm() {
    _formGroup = FormGroup({
      'email': FormControl<String>(
        validators: [
          Validators.required,
          Validators.email,
        ],
      ),
      'password': FormControl<String>(
        validators: [
          Validators.required,
          Validators.minLength(6),
        ],
      ),
    });
  }

  void _onSubmit() {
    if (_formGroup.valid) {
      final email = _formGroup.control('email').value as String;
      final password = _formGroup.control('password').value as String;
      
      context.read<AuthBloc>().add(
        AuthEvent.login(email: email, password: password),
      );
    } else {
      _formGroup.markAllAsTouched();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            state.when(
              initial: () {},
              loading: () {},
              authenticated: (user) {
                if (user.isTechnician) {
                  context.router.navigateNamed('/main');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please use web portal for authentication.'),
                      backgroundColor: Colors.blue,
                    ),
                  );
                }
              },
              unauthenticated: () {},
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor: Colors.red,
                  ),
                );
              },
            );
          },
          builder: (context, state) {
            final isLoading = state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            );

            return Center(
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Image.asset(
                          'assets/images/csg-logo.png',
                          height: 100.h,
                        ),
                      ),
                      Image.asset(
                        'assets/images/fsm_logo.png',
                        height: 250.h,
                        width: 250.w,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'FIELD SERVICE ENGINEER',
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      LoginForm(
                        formGroup: _formGroup,
                        onSubmit: _onSubmit,
                        isLoading: isLoading,
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Expanded(
                            child: GradientElevatedButton(
                              onPressed: isLoading ? null : _onSubmit,
                              isLoading: isLoading,
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _formGroup.dispose();
    super.dispose();
  }
}