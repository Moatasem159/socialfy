import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/extensions/empty_padding_extension.dart';
import 'package:socialfy/core/extensions/screen_size_extension.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/font_manager.dart';
import 'package:socialfy/core/widgets/buttons.dart';
import 'package:socialfy/core/widgets/loading_widget.dart';
import 'package:socialfy/features/login/presentation/cubit/login_cubit.dart';
import 'package:socialfy/features/login/presentation/cubit/login_state.dart';
class LoginButton extends StatelessWidget {
  const LoginButton({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginStates>(
      builder: (context, state) {
        LoginCubit cubit = LoginCubit.get(context);
        return Column(
          children: [
            15.ph,
            if (state is !LoginLoadingState)
              MainButton(
                  onPressed:cubit.login,
                  width: context.getWidth(w: 1.2),
                  height: context.getHeight(h:18),
                  color: Theme.of(context).primaryColor,
                  child:Text("login",
                      style: AppTextStyles.getNormalText(
                          fontSize: FontSize.s16,
                          color: Theme.of(context).primaryColorLight))),
            if (state is LoginLoadingState)
              const LoadingWidget(size: 50),
          ],
        );
      },
    );
  }
}