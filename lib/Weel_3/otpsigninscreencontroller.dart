import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class otpSigninFormController extends GetxController {
  final emailController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final phoneFocusNode = FocusNode().obs;
}
