import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/extensions/screen_size_extension.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/font_manager.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/core/widgets/buttons.dart';
import 'package:socialfy/core/widgets/loading_widget.dart';
import 'package:socialfy/features/register/presentation/cubit/register_cubit.dart';
import 'package:socialfy/features/register/presentation/cubit/register_state.dart';
class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterStates>(
      builder: (context, state) {
        RegisterCubit cubit = RegisterCubit.get(context);
        return Column(
          children: [
            if (state is! UserRegisterLoadingState)
              MainButton(
                width: context.getWidth(w: 1.8),
                height: context.getHeight(h: 16),
                color: Theme.of(context).primaryColor,
                onPressed: cubit.userRegister,
                child: Text(AppStrings.register,
                    style: AppTextStyles.getNormalText(
                        fontSize: FontSize.s16,
                        color: Theme.of(context).primaryColorLight)),
              ),
            if (state is UserRegisterLoadingState)
              const LoadingWidget(size: 50),
          ],
        );
      },
    );
  }
}