import 'package:academy_app/models/common_functions.dart';
import 'package:academy_app/models/update_user_model.dart';
import 'package:academy_app/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

import '../generated/l10n.dart';

class ForgotPassword extends StatefulWidget {
  static const routeName = '/reset';
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

Future<UpdateUserModel> resendCode(String email) async {
  const String apiUrl = "$BASE_URL/api/forgot_password";

  final response = await http.post(Uri.parse(apiUrl), body: {
    'email': email,
  });

  if (response.statusCode == 200) {
    final String responseString = response.body;

    return updateUserModelFromJson(responseString);
  } else {
    throw Exception('Failed to load data');
  }
}

class _ForgotPasswordState extends State<ForgotPassword> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  var _isLoading = false;
  final _emailController = TextEditingController();

  Future<void> _submit() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final UpdateUserModel user = await resendCode(_emailController.text);

      if (user.status == 200) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pop();
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
        CommonFunctions.showSuccessToast(user.message.toString());
      } else {
        // ignore: use_build_context_synchronously
        CommonFunctions.showErrorDialog(user.message.toString(), context);
      }
    } catch (error) {
      var errorMsg = S.of(context).errorOccured;
      CommonFunctions.showErrorDialog(errorMsg, context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  InputDecoration getInputDecoration(String hintext, IconData iconData) {
    return InputDecoration(
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(color: Colors.white, width: 2),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(color: Colors.white, width: 2),
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(color: Color(0xFFF65054)),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(color: Color(0xFFF65054)),
      ),
      filled: true,
      prefixIcon: Icon(
        iconData,
        color: kTextLowBlackColor,
      ),
      hintStyle: const TextStyle(color: Colors.black54, fontSize: 14),
      hintText: hintext,
      fillColor: kBackgroundColor,
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        key: scaffoldKey,
        elevation: 0,
        iconTheme: const IconThemeData(color: kSelectItemColor),
        backgroundColor: kBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Form(
                key: globalFormKey,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: kBackgroundColor,
                          child: Image.asset(
                            'assets/images/do_login.png',
                            height: 70,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                          Text(
                          S.of(context).forgetPassword ,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 20),
                          Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
                            child: Text(
                              S.of(context).email,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
                          child: TextFormField(
                            style: const TextStyle(fontSize: 14),
                            decoration: getInputDecoration(
                              S.of(context).email,
                              Icons.email_outlined,
                            ),
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (input) =>
                                !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                        .hasMatch(input!)
                                    ? S.of(context).emailIdShouldBeValid
                                    : null,
                            onSaved: (value) {
                              // _authData['email'] = value.toString();
                              _emailController.text = value as String;
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                          Text(
                          S.of(context).provideYourEmailAddressToResetPassword,
                          style: TextStyle(color: kSecondaryColor),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: _isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: MaterialButton(
                                    elevation: 0,
                                    color: kRedColor,
                                    onPressed: _submit,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 16),
                                    splashColor: Colors.greenAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(10),
                                      // side: const BorderSide(color: kRedColor),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children:   [
                                        Text(
                                          S.of(context).resetPassword,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Text(
                    S.of(context).wantToGoBack,
                    style: TextStyle(
                      color: kTextLowBlackColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(AuthScreen.routeName);
                    },
                    child:   Text(
                      S.of(context).signIn,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
