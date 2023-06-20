import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/features/login/presentation/cubit/login_cubit.dart';
import 'package:socialfy/features/login/presentation/cubit/login_state.dart';
import 'package:socialfy/features/login/presentation/widgets/login_form_widgets/login_form_body.dart';
class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginStates>(
      listener:LoginCubit.get(context).listen,
      child: Form(
        key: LoginCubit.get(context).formKey,
        child: const LoginFormBody(),
      ),
    );
  }
}