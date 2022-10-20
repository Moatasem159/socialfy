import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:socialfy/config/routes/routes_manager.dart';
import 'package:socialfy/core/utils/strings_manager.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width - 100, 50)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7)))),
          onPressed: () {
            Navigator.pushNamed(context, Routes.registerScreenRoute);
          },
          child:Text(AppStrings.startWithEmail,style: Theme.of(context).textTheme.button,),
        ),
        const SizedBox(
          height: 12,
        ),
        ElevatedButton(
          style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width - 100, 50)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7))),
              backgroundColor:
              MaterialStateProperty.all(Colors.blueAccent)),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(FontAwesomeIcons.facebook),
              SizedBox(
                width: 15,
              ),
              Text(AppStrings.signUpWithFacebook),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        ElevatedButton(
          style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width - 100, 50)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7))),
              backgroundColor: MaterialStateProperty.all(Colors.red)),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(FontAwesomeIcons.google),
              SizedBox(
                width: 15,
              ),
              Text(AppStrings.signUpWithGoogle),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              AppStrings.alreadyHaveAccount,
              style: Theme.of(context).textTheme.bodyText1!,
            ),
            const SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(Routes.loginScreenRoute);
              },
              child: Text(AppStrings.signIn,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  decoration: TextDecoration.underline
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
