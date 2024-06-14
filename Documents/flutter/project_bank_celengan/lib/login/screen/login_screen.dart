import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_api/componen/background_widget.dart';
import 'package:flutter_login_api/login/cubit/login_cubit.dart';

import 'login_form.dart'; // Pastikan Anda mengimpor LoginForm

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => const LoginScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(), // Menambahkan BackgroundWidget
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: BlocProvider<LoginCubit>(
              create: (context) {
                return LoginCubit(
                  authRepository:
                      RepositoryProvider.of<AuthRepository>(context),
                );
              },
              child: const LoginForm(),
            ),
          ),
        ],
      ),
    );
  }
}
