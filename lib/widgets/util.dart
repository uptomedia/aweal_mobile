import 'package:academy_app/models/common_functions.dart';
import 'package:academy_app/providers/courses.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';

buildPopupDialog(BuildContext context, items) {
  return AlertDialog(
    title:   Text(S.of(context).notifying),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:   <Widget>[
        Text(S.of(context).doYouWishToRemoveThisCourse),
      ],
    ),
    actions: <Widget>[
      MaterialButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child:   Text(
          S.of(context).no,
          style: TextStyle(color: Colors.red),
        ),
      ),
      MaterialButton(
        onPressed: () {
          Navigator.of(context).pop();
          Provider.of<Courses>(context, listen: false)
              .toggleWishlist(items, true)
              .then((_) =>
                  CommonFunctions.showSuccessToast(S.of(context).removedFromWishlist));
        },
        textColor: Theme.of(context).primaryColor,
        child: Text(
          S.of(context).yes,
          style: TextStyle(color: Colors.green),
        ),
      ),
    ],
  );
}

buildPopupDialogWishList(BuildContext context, isWishlisted, id, msg) {
  return AlertDialog(
    title: Text(S.of(context).notifying),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        msg
            ?   Text(S.of(context).doYouWantRemoveIt)
            :   Text(S.of(context).doYouWantToAddIt),
      ],
    ),
    actions: <Widget>[
      MaterialButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child:   Text(
  S.of(context).no,
          style: TextStyle(color: Colors.red),
        ),
      ),
      MaterialButton(
        onPressed: () {
          Navigator.of(context).pop();
          var msg = isWishlisted ? S.of(context).removedFromWishlist  : S.of(context).addedToWishlist;
          CommonFunctions.showSuccessToast(msg);
          Provider.of<Courses>(context, listen: false).toggleWishlist(id, false);
        },
        textColor: Theme.of(context).primaryColor,
        child:  Text(
  S.of(context).yes,
          style: TextStyle(color: Colors.green),
        ),
      ),
    ],
  );
}
