
import 'package:flutter/material.dart';
import 'package:smartpay/ui/widgets/auth_field.dart';
import 'package:smartpay/ui/widgets/custom_appbar.dart';
import 'package:smartpay/ui/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';

import 'create_new_password_viewmodel.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return  ViewModelBuilder<CreateNewPasswordViewModel>.reactive(
        viewModelBuilder: ()=> CreateNewPasswordViewModel(),
        builder: (
        BuildContext context, CreateNewPasswordViewModel viewModel, Widget? child

            ){
          return Scaffold(
            appBar: const CustomAppBar(),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text("data"),
                  const SizedBox(height: 12,),
                  const Text("Please, enter a new password below different from the previous password"),
                  const SizedBox(height: 32,),
                  AuthField(
                    controller: viewModel.createPasswordController,
                    hintText: 'Create Password',
                    isVisible: viewModel.isCreatePassWordVisible,
                    borderRadius: BorderRadius.circular(16),
                    isPassword: true,
                    isBorderColor: true,
                    maxLines: 1,
                    changeVisibilty: viewModel.changeCreatePasswordVisibility,
                  ),
                  const SizedBox(height: 16,),
                  AuthField(
                    controller: viewModel.confirmPasswordController,
                    hintText: 'Confirm Password',
                    isVisible: viewModel.isConfirmPassWordVisible,
                    borderRadius: BorderRadius.circular(16),
                    isPassword: true,
                    isBorderColor: true,
                    maxLines: 1,
                    changeVisibilty: viewModel.changeConfirmPasswordVisibility,
                  ),
                  Container(),
                  CustomButton(text: "Create new password", onPressed: viewModel.createNewPassword)

                ],
              ),
            ),
          );

        });
  }
}
