import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginForm extends StatefulWidget {
  final FormGroup formGroup;
  final VoidCallback onSubmit;
  final bool isLoading;

  const LoginForm({
    super.key,
    required this.formGroup,
    required this.onSubmit,
    this.isLoading = false,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isPasswordHidden = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: widget.formGroup,
      child: Column(
        children: [
          SizedBox(height: 15.h),
          ReactiveTextField<String>(
            formControlName: 'email',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              hintText: "Enter Your Email",
              labelText: "Email ID",
            ),
            validationMessages: {
              ValidationMessage.required: (_) => 'Email is required',
              ValidationMessage.email: (_) => 'Please enter a valid email',
            },
          ),
          SizedBox(height: 15.h),
          ReactiveTextField<String>(
            formControlName: 'password',
            obscureText: _isPasswordHidden,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.text,
            onSubmitted: (_) => widget.onSubmit(),
            decoration: InputDecoration(
              hintText: "Enter Your Password",
              labelText: "Password",
              suffixIcon: GestureDetector(
                onTap: _togglePasswordVisibility,
                child: Icon(
                  _isPasswordHidden ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
            validationMessages: {
              ValidationMessage.required: (_) => 'Password is required',
              ValidationMessage.minLength: (_) => 'Password must be at least 6 characters',
            },
          ),
          SizedBox(height: 15.h),
        ],
      ),
    );
  }
}