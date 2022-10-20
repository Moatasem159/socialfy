import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/app/injection_container.dart';
import 'package:socialfy/features/login/presentation/cubit/login_cubit.dart';
import 'package:socialfy/features/login/presentation/widgets/login_form.dart';
import 'package:socialfy/features/login/presentation/widgets/login_welcome_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginCubit>(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
            child: Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            toolbarHeight: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: const [
                LoginWelcomeWidget(),
                LoginForm(),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
