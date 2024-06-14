import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_api/componen/text.dart';
import 'package:flutter_login_api/login/cubit/login_cubit.dart';
import 'package:flutter_login_api/login/models/models.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text("Authentication Failed"),
              ),
            );
        }
      },
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            20,
          ),
          child: SizedBox(
            width: 320,
            height: 370,
            // color: Colors.white,
            child: Stack(
              children: [
                // blur effect
                BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 100,
                    sigmaY: 100,
                  ),
                  child: Container(),
                ),
                // gradient effect
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color(0xff014872).withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.white.withOpacity(0.1),
                          Colors.white.withOpacity(0.4),
                        ]),
                  ),
                ),
                //child
                Padding(
                  padding: const EdgeInsets.only(top: 34),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          "LOGIN",
                          // style: mediumBoldWhite,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 40),
                        child: Text(
                          'Username',
                          // style: kecilRegulerWhite,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: Container(
                          padding: const EdgeInsets.all(1.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                10.0), // Radius border circular
                            border: Border.all(
                              color: blueColor, // GANTI Warna
                              // color: blueColor, // Warna border
                              width: 1.0, // Lebar border
                            ),
                          ),
                          child: const InputUsername(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 40),
                        child: Text(
                          'Password',
                          // style: kecilRegulerWhite,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: Container(
                          padding: const EdgeInsets.all(1.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                10.0), // Radius border circular
                            border: Border.all(
                              color: blueColor, // GANTI Warna
                              // color: blueColor, // Warna border
                              width: 1.0, // Lebar border
                            ),
                          ),
                          child: const InputPassword(),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Center(child: ButtonSubmit()),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      // child: const Align(
      //   alignment: Alignment(0, -1 / 3),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       InputUsername(),
      //       Padding(padding: EdgeInsets.all(12)),
      //       InputPassword(),
      //       Padding(padding: EdgeInsets.all(12)),
      //       ButtonSubmit(),
      //     ],
      //   ),
      // ),
    );
  }
}

class InputUsername extends StatelessWidget {
  const InputUsername({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_usernameInput_textField'),
          onChanged: (value) =>
              context.read<LoginCubit>().usernameChanged(value),
          decoration: InputDecoration(
              errorText:
                  state.username.displayError == UsernameValidationError.empty
                      ? 'invalid username'
                      : null,
              border: InputBorder.none,
              hintText: '', // Hint text
              hintStyle: kecilRegulerWhite),
        );
      },
    );
  }
}

class InputUsernmaeNoCubit extends StatelessWidget {
  const InputUsernmaeNoCubit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('loginForm_usernameInput_textField'),
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '', // Hint text
          hintStyle: kecilRegulerWhite),
    );
  }
}

class InputPassword extends StatelessWidget {
  const InputPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          return TextField(
            key: const Key('loginForm_passwordInput_textField'),
            onChanged: (value) =>
                context.read<LoginCubit>().passwordChanged(value),
            obscureText: true,
            decoration: InputDecoration(
              errorText: (() {
                switch (state.password.displayError) {
                  case PasswordValidationError.minimumLength:
                    return 'Password minimum 6 characters';
                  case PasswordValidationError.empty:
                    return 'Password cannot be empty';
                  default:
                    return null;
                }
              })(),
            ),
          );
        });
  }
}

class ButtonSubmit extends StatelessWidget {
  const ButtonSubmit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return state.status.isInProgress
          ? const CircularProgressIndicator()
          : ElevatedButton(
              key: const Key('loginForm_continue_raisedButton'),
              onPressed: () {
                context.read<LoginCubit>().loginSubmitted();
              },
              child: const Text("Login"),
            );
    });
  }
}
