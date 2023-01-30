// ignore_for_file: use_build_context_synchronously

import 'package:academy_app/models/common_functions.dart';
import 'package:academy_app/providers/course_forum.dart';
import 'package:academy_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../generated/l10n.dart';

class AskQuestionWidget extends StatefulWidget {
  static const routeName = '/ask-question';
  final int courseId;
  const AskQuestionWidget({Key? key, required this.courseId}) : super(key: key);

  @override
  State<AskQuestionWidget> createState() => _AskQuestionWidgetState();
}

class _AskQuestionWidgetState extends State<AskQuestionWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  bool _isLoading = false;
  dynamic title;
  dynamic description;

  @override
  void initState() {
    super.initState();
  }

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
      await Provider.of<CourseForum>(context, listen: false)
          .addForumQuestion(widget.courseId, title, description);
      CommonFunctions.showSuccessToast('User updated Successfully');
      Navigator.of(context).pop();
    } catch (error) {
      // print(error);
      const errorMsg = 'Update failed!';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:   CustomText(
          text: S.of(context).askYourQuestion,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(
          color: kSecondaryColor, //change your color here
        ),
        backgroundColor: kBackgroundColor,
        actions: <Widget>[
          IconButton(
              icon: const Icon(
                Icons.cancel_outlined,
                color: kSecondaryColor,
                size: 20,
              ),
              onPressed: () => Navigator.of(context).pop()),
        ],
      ),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                      Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          S.of(context).titleOfSummary,
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
                        S.of(context).titleOfSummary ,
                        Icons.title,
                      ),
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        setState(() {
                          title = value.toString();
                        });
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
                          S.of(context).details,
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
                        S.of(context).details ,
                        Icons.edit,
                      ),
                      keyboardType: TextInputType.text,
                      maxLines: 10,
                      onSaved: (value) {
                        setState(() {
                          description = value.toString();
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: _isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : MaterialButton(
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
                                S.of(context).publish,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                    )
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
