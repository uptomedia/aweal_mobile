import 'dart:io';

import 'package:academy_app/models/common_functions.dart';
import 'package:academy_app/providers/auth.dart';
import 'package:academy_app/widgets/app_bar_two.dart';
import 'package:academy_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../generated/l10n.dart';

class EditPasswordScreen extends StatefulWidget {
  static const routeName = '/edit-password';
  const EditPasswordScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EditPasswordScreenState createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  bool hidePassword = true;
  var _isLoading = false;
  final Map<String, String> _passwordData = {
    'oldPassword': '',
    'newPassword': '',
  };
  final _passwordController = TextEditingController();

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<Auth>(context, listen: false).updateUserPassword(
          _passwordData['oldPassword'].toString(),
          _passwordData['newPassword'].toString());

      CommonFunctions.showSuccessToast('Password updated Successfully');
    } on HttpException {
      var errorMsg = S.of(context).passwordUpdateFailed;
      CommonFunctions.showErrorDialog(errorMsg, context);
    } catch (error) {
      // print(error);
       var errorMsg = S.of(context).passwordUpdateFailed;
      CommonFunctions.showErrorDialog(errorMsg, context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  InputDecoration getInputDecoration(String hintext, IconData iconData) {
    return InputDecoration(
      enabledBorder: kDefaultInputBorder,
      focusedBorder: kDefaultFocusInputBorder,
      focusedErrorBorder: kDefaultFocusErrorBorder,
      errorBorder: kDefaultFocusErrorBorder,
      filled: true,
      hintStyle: const TextStyle(color: kFormInputColor),
      hintText: hintext,
      fillColor: Colors.white70,
      prefixIcon: Icon(
        iconData,
        color: kFormInputColor,
      ),
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            hidePassword = !hidePassword;
          });
        },
        color: kTextLowBlackColor,
        icon: Icon(hidePassword
            ? Icons.visibility_off_outlined
            : Icons.visibility_outlined),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarTwo(),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 70,
            ),
              Padding(
              padding: EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.center,
                child: CustomText(
                  text:S.of(context).updatePassword,
                  colors: kTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            _isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                            Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                S.of(context).currentPassword,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          TextFormField(
                            style:   TextStyle(fontSize: 16),
                            decoration: getInputDecoration(
                              S.of(context).currentPassword,
                              Icons.vpn_key,
                            ),
                            obscureText: hidePassword,
                            // ignore: missing_return
                            validator: (value) {
                              if (value!.isEmpty) {
                                return S.of(context).canNotBeEmpty;
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _passwordData['oldPassword'] = value.toString();
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                            Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                S.of(context).newPassword,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          TextFormField(
                            style: const TextStyle(fontSize: 16),
                            decoration: getInputDecoration(
                              S.of(context).newPassword,
                              Icons.vpn_key,
                            ),
                            obscureText: hidePassword,
                            controller: _passwordController,
                            // ignore: missing_return
                            validator: (value) {
                              if (value!.isEmpty || value.length < 4) {
                                return S.of(context).passwordIsTooShort;
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _passwordData['newPassword'] = value.toString();
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                            Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                S.of(context).confirmPassword,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          TextFormField(
                            style: const TextStyle(fontSize: 16),
                            decoration: getInputDecoration(
                              S.of(context).confirmPassword,
                              Icons.vpn_key,
                            ),
                            obscureText: hidePassword,
                            // ignore: missing_return
                            validator: (value) {
                              if (value != _passwordController.text) {
                                return S.of(context).passwordsDoNotmatch;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: MaterialButton(
                              onPressed: _submit,
                              color: kRedColor,
                              textColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              splashColor: Colors.redAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0),
                                side: const BorderSide(color: kRedColor),
                              ),
                              child:   Text(
                                S.of(context).updateNow,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
