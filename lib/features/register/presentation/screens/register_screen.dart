import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/app/injection_container.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/core/widgets/custom_appbar.dart';
import 'package:socialfy/features/register/presentation/cubit/register_cubit.dart';
import 'package:socialfy/features/register/presentation/widgets/register_screen_body.dart';
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegisterCubit>(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: const CustomAppBar(title: AppStrings.createAccount),
            body: const RegisterScreenBody(),
          ),
        ),
      ),
    );
  }
}