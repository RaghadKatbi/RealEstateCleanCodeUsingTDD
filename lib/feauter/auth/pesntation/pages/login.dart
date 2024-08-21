import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/widget/loading.dart';
import 'package:real_estate/feauter/auth/pesntation/bloc_auth/auth_cubit.dart';

import 'package:real_estate/feauter/auth/pesntation/pages/register.dart';

import '../../../../core/widget/my_textfield.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController numberController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: const Color(0xf0d0dae6),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(100),
                    bottom: ScreenUtil().setHeight(60),
                  ),
                  child: Image.asset("asset/images/Artboard.png"),
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: myTextFormField(
                              hintText: "رقم الهاتف",
                              icon: Icons.phone,
                              textInputType: TextInputType.phone,
                              maxLine: 1,
                              maxLength: 10,
                              textEditingController: numberController,
                              enable: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'الرجاء إدخال رقم الهاتف';
                                }
                                if (!value.contains(RegExp(r'^[0-9]+$'))) {
                                  return 'رقم الهاتف يجب أن يحتوي على أرقام فقط';
                                }
                                return null;
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: myTextFormField(
                              hintText: "كلمة المرور",
                              icon: Icons.visibility,
                              textInputType: TextInputType.visiblePassword,
                              maxLine: 1,
                              maxLength: 30,
                              textEditingController: passwordController,
                              enable: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'الرجاء إدخال كلمة المرور';
                                }
                                if (value.length < 6) {
                                  return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
                                }
                                return null;
                              }),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RegisterPage()),
                              );
                            },
                            child: Text(
                              "ليس لديك حساب ؟ ",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  fontFamily: 'changes',
                                  color: const Color(0xff0c3c6d),
                                  fontSize: ScreenUtil().setSp(25),
                                  decoration: TextDecoration.underline),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SizedBox(
                              width: 180.w,
                              // Use ScreenUtil for responsive width
                              height: 50.h,
                              // Use ScreenUtil for responsive height
                              child: ElevatedButton(
                                  style: const ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                          Color(0xffd1d1d1))),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      print(numberController.text);
                                      print(passwordController.text);
                                      context.read<AuthCubit>().login(
                                          numberController.text,
                                          passwordController.text);
                                      if (state is LoginSuccess) {
                                        print("success");
                                      } else if (state is LoginFailure) {
                                        print(state.message);
                                      }
                                    }
                                  },
                                  child: state is LoginLoading
                                      ? const LoadingWidget()
                                      : Text(
                                          "تسجيل الدخول",
                                          style: TextStyle(
                                              fontSize: ScreenUtil().setSp(18),
                                              color: const Color(0xff0c3c6d),
                                              fontFamily: 'changes'),
                                        ))),
                        ),
                      ],
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
