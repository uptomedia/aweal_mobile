import 'dart:io';
import 'package:academy_app/constants.dart';
import 'package:academy_app/models/common_functions.dart';
import 'package:academy_app/models/user.dart';
import 'package:academy_app/providers/auth.dart';
import 'package:academy_app/widgets/app_bar_two.dart';
import 'package:academy_app/widgets/user_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';

class EditProfileScreen extends StatefulWidget {
  static const routeName = '/edit-profile';
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  bool _isLoading = false;

  final Map<String, String> _userData = {
    'first_name': '',
    'last_name': '',
    'email': '',
    'bio': '',
    'twitter': '',
    'facebook': '',
    'linkedin': '',
  };

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();

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
      // Log user in
      // print(_userData['first_name']);
      final updateUser = User(
        userId: 'Temp',
        firstName: _userData['first_name'],
        lastName: _userData['last_name'],
        email: _userData['email'],
        role: 'Temp',
        biography: _userData['bio'],
        twitter: _userData['twitter'],
        facebook: _userData['facebook'],
        linkedIn: _userData['linkedin'],
      );
      await Provider.of<Auth>(context, listen: false)
          .updateUserData(updateUser);

      CommonFunctions.showSuccessToast('User updated Successfully');
    } on HttpException {
      var errorMsg = S.of(context).updateFailed;
      CommonFunctions.showErrorDialog(errorMsg, context);
    } catch (error) {
      // print(error);
      var errorMsg =S.of(context).updateFailed;
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
      contentPadding: const EdgeInsets.symmetric(vertical: 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarTwo(),
      backgroundColor: kBackgroundColor,
      body: FutureBuilder(
        future: Provider.of<Auth>(context, listen: false).getUserInfo(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (dataSnapshot.error != null) {
              return   Center(
                child: Text(S.of(context).errorOccured),
              );
            } else {
              return Consumer<Auth>(
                builder: (context, authData, child) {
                  final user = authData.user;
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Padding(
                          padding:
                              EdgeInsets.only(left: 15, top: 10, bottom: 5.0),
                          child: Text(
                            S.of(context).updateProfilePicture,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: UserImagePicker(
                            image: user.image,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
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
                                      padding: EdgeInsets.only(
                                          left: 0.0, bottom: 5.0),
                                      child: Text(
                                        S.of(context).firstName,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0, bottom: 8.0),
                                    child: TextFormField(
                                      style: const TextStyle(fontSize: 14),
                                      initialValue: user.firstName,
                                      decoration: getInputDecoration(
                                          S.of(context).firstName, Icons.person),
                                      keyboardType: TextInputType.name,
                                      // controller: _firstNameController,
                                      // ignore: missing_return
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return S.of(context).firstNameCannotBeEmpty;
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _userData['first_name'] =
                                            value.toString();
                                        _firstNameController.text =
                                            value as String;
                                      },
                                    ),
                                  ),
                                    Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 5.0),
                                      child: Text(
                                        S.of(context).lastName ,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: TextFormField(
                                      style: const TextStyle(fontSize: 14),
                                      initialValue: user.lastName,
                                      decoration: getInputDecoration(
                                        S.of(context).lastName,
                                        Icons.person,
                                      ),
                                      keyboardType: TextInputType.name,
                                      // controller: _lastNameController,
                                      // ignore: missing_return
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return S.of(context).lastNameCannotBeEmpty;
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _userData['last_name'] =
                                            value.toString();
                                        _lastNameController.text =
                                            value as String;
                                      },
                                    ),
                                  ),
                                    Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 5.0),
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
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: TextFormField(
                                      style: const TextStyle(fontSize: 14),
                                      initialValue: user.email,
                                      decoration: getInputDecoration(
                                        S.of(context).email,
                                        Icons.email,
                                      ),
                                      // controller: _emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (input) =>
                                          !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                                  .hasMatch(input!)
                                              ? S.of(context).emailIdShouldBeValid
                                              : null,
                                      onSaved: (value) {
                                        _userData['email'] = value.toString();
                                        _emailController.text = value as String;
                                      },
                                    ),
                                  ),
                                    Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 5.0),
                                      child: Text(
                                        S.of(context).biography,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    style: const TextStyle(fontSize: 16),
                                    initialValue: user.biography,
                                    decoration: getInputDecoration(
                                      S.of(context).biography,
                                      Icons.edit,
                                    ),
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    onSaved: (value) {
                                      _userData['bio'] = value.toString();
                                    },
                                  ),
                                    Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 5.0),
                                      child: Text(
                                        S.of(context).facebookLink,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    style: const TextStyle(fontSize: 16),
                                    initialValue: user.facebook,
                                    decoration: getInputDecoration(
                                      S.of(context).facebookLink,
                                      MdiIcons.facebook,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    onSaved: (value) {
                                      _userData['facebook'] = value.toString();
                                    },
                                  ),
                                    Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 5.0),
                                      child: Text(
                                        S.of(context).twitterLink,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    style: const TextStyle(fontSize: 16),
                                    initialValue: user.twitter,
                                    decoration: getInputDecoration(
                                      S.of(context).twitterLink,
                                      MdiIcons.twitter,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    onSaved: (value) {
                                      _userData['twitter'] = value.toString();
                                    },
                                  ),
                                    Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 5.0),
                                      child: Text(
                                        S.of(context).linkedInLink,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    style: const TextStyle(fontSize: 16),
                                    initialValue: user.linkedIn,
                                    decoration: getInputDecoration(
                                      S.of(context).linkedInLink ,
                                      MdiIcons.linkedin,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    onSaved: (value) {
                                      _userData['linkedin'] = value.toString();
                                    },
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: _isLoading
                                        ? const CircularProgressIndicator()
                                        : MaterialButton(
                                            onPressed: _submit,
                                            color: kRedColor,
                                            textColor: Colors.white,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 15),
                                            splashColor: Colors.redAccent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7.0),
                                              side: const BorderSide(
                                                  color: kRedColor),
                                            ),
                                            child: Text(
                                              S.of(context).updateNow,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
