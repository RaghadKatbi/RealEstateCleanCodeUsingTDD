import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widget/my_textfield.dart';
import '../bloc_auth/auth_cubit.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  @override
  void dispose() {
    phone.dispose();
    password.dispose();
    name.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xf0d0dae6),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: ScreenUtil().setHeight(10),
              horizontal: ScreenUtil().setWidth(10)),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: ScreenUtil().setHeight(40)),
                Center(
                  child: Image.asset("asset/images/Artboard.png"),
                ),
                SizedBox(height: ScreenUtil().setHeight(40)),
                Center(
                  child: Text(
                    "إنشاء حساب",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(24),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'changes',
                      color: const Color(0xff0c3c6d),
                    ),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(20)),
                myTextFormField(
                  hintText: "الإسم",
                  icon: Icons.person,
                  textInputType: TextInputType.name,
                  maxLine: 1,
                  maxLength: 20,
                  textEditingController: name,
                  enable: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال اسمك';
                    }
                    return null;
                  },
                ),
                SizedBox(height: ScreenUtil().setHeight(20)),
                myTextFormField(
                  hintText: "رقم الهاتف",
                  icon: Icons.phone,
                  textInputType: TextInputType.phone,
                  maxLine: 1,
                  maxLength: 10,
                  textEditingController: phone,
                  enable: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال رقم الهاتف';
                    }
                    if (!value.contains(RegExp(r'^[0-9]+$'))) {
                      return 'رقم الهاتف يجب أن يحتوي على أرقام فقط';
                    }
                    return null;
                  },
                ),
                SizedBox(height: ScreenUtil().setHeight(20)),
                myTextFormField(
                  hintText: "كلمة المرور",
                  icon: Icons.visibility,
                  textInputType: TextInputType.visiblePassword,
                  maxLine: 1,
                  maxLength: 30,
                  textEditingController: password,
                  enable: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال كلمة المرور';
                    }
                    if (value.length < 6) {
                      return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
                    }
                    return null;
                  },
                ),
                SizedBox(height: ScreenUtil().setHeight(20)),
                myTextFormField(
                  hintText: "تأكيد كلمة المرور",
                  icon: Icons.visibility,
                  textInputType: TextInputType.visiblePassword,
                  maxLine: 1,
                  maxLength: 30,
                  textEditingController: confirmPassword,
                  enable: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء تأكيد كلمة المرور';
                    }
                    if (value != password.text) {
                      return 'كلمة المرور غير متطابقة';
                    }
                    return null;
                  },
                ),
                SizedBox(height: ScreenUtil().setHeight(20)),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                    },
                    child: Text(
                      "هل لديك حساب ؟ ",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontFamily: 'changes',
                        color: const Color(0xff0c3c6d),
                        fontSize: ScreenUtil().setSp(24),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(20)),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return Center(
                      child: SizedBox(
                        width: ScreenUtil().setWidth(180),
                        height: ScreenUtil().setHeight(50),
                        child: ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Color(0xffd1d1d1)),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthCubit>().register(
                                  name.text,
                                  phone.text,
                                  password.text,
                                  confirmPassword.text);
                            }
                          },
                          child: Text(
                            "إنشاء حساب",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(18),
                              color: const Color(0xff0c3c6d),
                              fontFamily: 'changes',
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
