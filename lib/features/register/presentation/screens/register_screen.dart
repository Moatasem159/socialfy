import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/app/injection_container.dart';
import 'package:socialfy/core/utils/icons_manager.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/core/utils/values_manager.dart';
import 'package:socialfy/features/register/presentation/cubit/register_cubit.dart';
import 'package:socialfy/features/register/presentation/widgets/register_form.dart';

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
              backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            title: Text(
              AppStrings.createAccount,
              style: Theme.of(context)
                  .appBarTheme
                  .titleTextStyle!
                  .copyWith(fontSize: 18),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(MyCustomIcons.logo, size: AppSize.s110),
                    SizedBox(
                      width: 25,
                    )
                  ],
                ),
                const RegisterForm(),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
