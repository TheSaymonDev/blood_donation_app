import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:free_blood_donation/routes/app_routes.dart';
import 'package:free_blood_donation/screens/login_screen/controllers/login_controller.dart';
import 'package:free_blood_donation/screens/login_screen/models/login_model.dart';
import 'package:free_blood_donation/utils/app_colors.dart';
import 'package:free_blood_donation/utils/app_const_functions.dart';
import 'package:free_blood_donation/utils/app_validations.dart';
import 'package:free_blood_donation/widgets/custom_app_bar.dart';
import 'package:free_blood_donation/widgets/custom_elevated_button.dart';
import 'package:free_blood_donation/widgets/custom_text_form_field.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  late String _phone;

  @override
  void initState() {
    super.initState();
    _phone = Get.arguments['phone'] as String;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          onPressed: () {
            Get.back();
          },
          title: 'loginAppbar'.tr),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(100.h),
                Align(
                    alignment: Alignment.center,
                    child: FaIcon(FontAwesomeIcons.key,
                        color: primaryClr, size: 100.sp)),
                Gap(16.h),
                Align(
                    alignment: Alignment.center,
                    child: Text('appName'.tr,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 35.sp))),
                Gap(100.h),
                Text('loginTitle'.tr,
                    style: Theme.of(context).textTheme.titleLarge),
                Gap(8.h),
                Text('loginDes'.tr,
                    style: Theme.of(context).textTheme.bodyMedium),
                Gap(24.h),
                CustomTextFormField(
                  hintText: 'pinHint'.tr,
                  controller: _passwordController,
                  keyBoardType: TextInputType.phone,
                  validator: AppValidators.pinValidator
                ),
                Gap(24.h),
                GetBuilder<LoginController>(
                    builder: (controller) => controller.isLoading
                        ? AppConstFunctions.customCircularProgressIndicator
                        : CustomElevatedButton(
                        onPressed: () {
                          _formOnSubmit(controller);
                        },
                        name: 'loginBtn'.tr)),

              ],
            ),
          ),
        ),
      ),
    );
  }

  void _formOnSubmit(LoginController controller) async{
    if(_formKey.currentState!.validate()){
      final result = await controller.loginUser(loginData: LoginModel(phone: _phone, password: _passwordController.text));
      if(result){
        _passwordController.clear();
        Get.toNamed(AppRoutes.homeScreen);
      }
    }
  }
}
