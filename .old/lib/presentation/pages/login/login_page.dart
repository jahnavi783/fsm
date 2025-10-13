import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsm_flutter/data/entity/user_entity.dart';
import 'package:fsm_flutter/presentation/core/themes/app_theme.dart';
import 'package:fsm_flutter/presentation/pages/fsm_dashboard/fsm_dashboard.dart';
import 'package:fsm_flutter/presentation/pages/login/cubit/login_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/components/custom_snackbar.dart';
import '../../core/components/gradient_elevated_button.dart';
import '../../core/form_errors/form_error.dart';
import '../../core/resources/image_resources.dart';
import '../profile/cubit/profile_screen_cubit.dart' show ProfileCubit;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late SharedPreferences sharedPreferences;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? email;
  String? password;
  bool _confirmPasswordIsHidden = true;
  bool validated = false;
  bool isLoading = false;
  String companyName = "";

  void _toggleConfirmPasswordView() {
    setState(() {
      _confirmPasswordIsHidden = !_confirmPasswordIsHidden;
    });
  }

  @override
  void initState() {
    initializeSharedPresefrence();
    super.initState();
  }

  initializeSharedPresefrence() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.user.roleId == UserRole.technician) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => FSMDashboardPage()));
            } else {
              showCustomSnackbar(
                  context, "Please use webportal for authentication.",
                  color: Colors.blue);
            }
          }
          if (state is LoginErrorState) {
            showCustomSnackbar(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Image.asset(AppImages.csgLogo, height: (100)),
                    ),
                    Image.asset(
                      AppImages.fsmLogo,
                      height: 250,
                      width: 250,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      'FIELD SERVICE ENGINEER',
                      style: TextStyle(
                        color: AppColors.initialColor,
                        fontSize: 22,
                        fontFamily: interFontFamily,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: (15)),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            autovalidateMode: validated
                                ? AutovalidateMode.onUserInteraction
                                : AutovalidateMode.disabled,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty &&
                                  !value.contains(emailNullError)) {
                                return emailNullError;
                              } else if (!emailValidatorRegExp
                                      .hasMatch(value) &&
                                  !value.contains(invalidEmailError)) {
                                return invalidEmailError;
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: "Enter Your Email",
                              labelText: "Email ID",
                              // prefixIcon: Icon(Icons.email_outlined),
                            ),
                          ),
                          SizedBox(height: (15)),
                          TextFormField(
                            controller: passwordController,
                            obscureText: _confirmPasswordIsHidden,
                            autovalidateMode: validated
                                ? AutovalidateMode.onUserInteraction
                                : AutovalidateMode.disabled,
                            validator: (value) {
                              if (value!.isEmpty &&
                                  !value.contains(passWordNullError)) {
                                return passWordNullError;
                              } else if (value.length < 6 &&
                                  !value.contains(shortPassError)) {
                                return shortPassError;
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Enter Your Password",
                              labelText: "Password",
                              // prefixIcon: const Icon(Icons.password),
                              suffixIcon: GestureDetector(
                                  onTap: _toggleConfirmPasswordView,
                                  child: _confirmPasswordIsHidden
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off)),
                            ),
                          ),
                          SizedBox(height: (15)),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: GradientElevatedButton(
                            onPressed: () async {
                              setState(() {
                                validated = true;
                              });
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                                final username = emailController.text;
                                final password = passwordController.text;
                                final cubit = context.read<LoginCubit>();
                                final profile = context.read<ProfileCubit>();
                                await cubit.loginUser(username, password);
                                profile.fetchUser();
                                // if (state is LoginSuccessState) {
                                //   if (state.loginModel.roles == 2 ||
                                //       state.loginModel.roles == 6 ||
                                //       state.loginModel.roles == 8) {
                                //     if (state.loginModel.roles == 8) {
                                //       Navigator.pushReplacement(
                                //           context,
                                //           MaterialPageRoute(
                                //               builder: (context) =>
                                //                   FSMDashboardPage()));
                                //     } else {
                                //       showCustomSnackbar(context,
                                //           "Work in progress, please check after some time",
                                //           color: Colors.blueGrey);
                                //     }
                                //   }
                                // }
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            },
                            child: isLoading
                                ? CircularProgressIndicator()
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Spacer(),
                    //     // InkWell(
                    //     //   onTap: () {
                    //     //     // Navigator.push(
                    //     //     //     context,
                    //     //     //     MaterialPageRoute(
                    //     //     //         builder: (context) => DashboardPage()));
                    //     //   },
                    //     //   child: Text(
                    //     //     'Forgot Password?',
                    //     //     style: TextStyle(
                    //     //       color: AppColors.finalColor,
                    //     //       fontSize: 14,
                    //     //       fontFamily: interFontFamily,
                    //     //       fontWeight: FontWeight.bold,
                    //     //     ),
                    //     //   ),
                    //     // ),
                    //     InkWell(
                    //       onTap: () {},
                    //       child: Text(
                    //         'Contact Us',
                    //         style: TextStyle(
                    //           color: AppColors.finalColor,
                    //           fontSize: 14,
                    //           fontFamily: interFontFamily,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //     )
                    //   ],
                    // )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
