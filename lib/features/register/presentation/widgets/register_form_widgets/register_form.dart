import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/features/register/presentation/cubit/register_cubit.dart';
import 'package:socialfy/features/register/presentation/cubit/register_state.dart';
import 'package:socialfy/features/register/presentation/widgets/register_form_widgets/register_button.dart';
import 'package:socialfy/features/register/presentation/widgets/register_form_widgets/register_fields.dart';
class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterStates>(
      listener: RegisterCubit.get(context).listen,
      child: Form(
        key: RegisterCubit.get(context).formKey,
        child: const Column(
          children: [
            RegisterFields(),
            RegisterButton(),
          ],
        ),
      ),
    );
  }
}