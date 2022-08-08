import 'package:base_clean_arch/core/configs/themes/styles.dart';
import 'package:base_clean_arch/core/constants/color_constants.dart';
import 'package:base_clean_arch/core/utils/responsive.dart';
import 'package:base_clean_arch/core/utils/validation.dart';
import 'package:base_clean_arch/feature/base/domain/entities/login/login_params.dart';
import 'package:base_clean_arch/feature/base/domain/entities/login/login_state.dart';
import 'package:base_clean_arch/feature/base/domain/entities/user_state/user_state_entities.dart';
import 'package:base_clean_arch/feature/base/presentation/modules/home/home_page.dart';
import 'package:base_clean_arch/feature/base/presentation/modules/login/login_cubit.dart';
import 'package:base_clean_arch/feature/base/presentation/widgets/card_background_tablet.dart';
import 'package:base_clean_arch/feature/base/presentation/widgets/custom_button.dart';
import 'package:base_clean_arch/feature/base/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/login_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: true,
          body: Form(
            key: _formKey,
            child: Center(
              // height: MediaQuery.of(context).size.height -
              //     MediaQuery.of(context).viewInsets.bottom,
              // padding: const EdgeInsets.only(
              //   left: 40,
              //   right: 40,
              // ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  left: 40,
                  right: 40,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 15,
                    ),
                    // jubelioLogo(context),
                    Column(
                      children: <Widget>[
                        _emailInput(),
                        const SizedBox(height: 10),
                        _passwordInput(),
                        const SizedBox(height: 15),
                        // forgotPassword(context, mainProvider),
                      ],
                    ),
                    // Expanded(child: Container()),
                    const SizedBox(height: 15),
                    // loginButton(context, mainProvider),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
          // bottomNavigationBar: Padding(
          //   padding: const EdgeInsets.only(bottom: 30),
          //   child: Text(
          //     'V ${mainProvider.version}',
          //     textAlign: TextAlign.center,
          //     style: const TextStyle(
          //       color: Colors.white,
          //       fontSize: 10,
          //       fontWeight: FontWeight.w600,
          //     ),
          //   ),
          // ),
        ),
      ],
    );
  }

  Widget _emailInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NormalText(
          text: 'Email',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        SizedBox(
          height: 8.h,
        ),
        TextFormField(
          key: const Key('emailInput'),
          controller: _emailController,
          autofocus: false,
          keyboardType: TextInputType.emailAddress,
          style: FormStyle.normalTextStyle.copyWith(fontSize: 14.sp),
          decoration: FormStyle.inputDecorationStyle.copyWith(
            hintText: 'Masukan email',
            hintStyle: FormStyle.normalTextStyle.copyWith(fontSize: 14.sp),
            contentPadding: EdgeInsets.only(left: 8.r, right: 8.r),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide:
                  const BorderSide(color: ColorConstants.shadowCardColor),
            ),
          ),
          textInputAction: TextInputAction.next,
          validator: (email) => Validation().validateEmail(email!),
        ),
      ],
    );
  }

  Widget _passwordInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NormalText(
              text: 'Password',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            SizedBox(
              height: 8.h,
            ),
            TextButton(
              child: NormalText(
                text: 'Lupa password ?',
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: ColorConstants.primary,
              ),
              onPressed: () => print('goto lupa password'),
            ),
          ],
        ),
        TextFormField(
          key: const Key('passInput'),
          controller: _passwordController,
          keyboardType: TextInputType.text,
          obscureText: !_passwordVisible,
          style: FormStyle.normalTextStyle
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
          decoration: FormStyle.inputDecorationStyle.copyWith(
            hintText: 'Masukan password',
            hintStyle: FormStyle.normalTextStyle.copyWith(fontSize: 14.sp),
            contentPadding: EdgeInsets.only(left: 8.r, right: 8.r),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide:
                  const BorderSide(color: ColorConstants.shadowCardColor),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                size: 24.r,
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
          ),
          textInputAction: TextInputAction.send,
          onFieldSubmitted: (value) {
            if (_formKey.currentState!.validate()) {
              context.read<LoginCubit>().postLogin(
                  LoginParam(_emailController.text, _passwordController.text));
            }
          },
          onChanged: (value) {
            setState(() {});
          },
          validator: (password) {
            if (password!.isEmpty || password == '') {
              return 'Password tidak boleh kosong';
            }
            return null;
          },
        ),
      ],
    );
  }
}
