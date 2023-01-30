import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Styles {
  /// App Settings
  static Color get colorPrimary => Color(0xFF1D8F78);


  //font

  static double get fontSize33 => 33.0.sp; //30
  static double get fontSize17 => 17.0.sp; //30
  static double get fontSize16 => 16.0.sp; //30
  static double get fontSize29 => 29.0.sp; //30
  static double get fontSize27 => 27.0.sp; //30
  static double get fontSize22 => 22.0.sp; //30
  static double get fontSize24 => 24.0.sp; //30
  static double get fontSize25 => 25.0.sp; //30
  static double get fontSize18 => 18.0.sp; //30
  static double get fontSize19 => 19.0.sp; //30
  static double get fontSize21 => 21.0.sp; //30
  static double get fontSize20 => 20.0.sp; //30
  static double get fontSize13 => 13.0.sp; //30
  static double get fontSize14 => 14.0.sp; //30
  static double get fontSize28 => 28.0.sp; //30
  static double get fontSize30 => 30.0.sp; //30
  static double get fontSize32 => 32.0.sp; //30
  static double get fontSize31 => 31.0.sp; //30
  static double get fontSize15 => 15.0.sp; //30
  static double get fontSize12 => 12.0.sp; //30






  static double get fontSize6 => 30.0.sp;
  static double fontSize11 = 11.0.sp;

//10
  /// font
  static const FontFamily = 'google_sans';
  static const FontFamilyBlack = 'Roboto';
  static const FontFamilyRegular = 'Roboto';
  static const FontFamilyBold = 'Roboto';
  static const FontFamilySemiBold = 'Roboto';
  static const FontFamilyLight = 'Roboto';
  static const FontFamilyRobotoMedium = 'Roboto';

  static const FontColorWhite = Color(0xFFFFFFFF);


  // static TextStyle get fontStyle => FontFamily;
  // static get mediumFontStyle => fontStyle.copyWith(
  //     fontFamily: "Poppins",
  //     fontWeight: FontWeight.w500);
  // static get semiBoldFontStyle =>
  //     fontStyle.copyWith(
  //         fontFamily: "Poppins",
  //         fontWeight: FontWeight.w600);

  // static TextStyle formInputTextStyle = fontStyle.copyWith(
  //
  //     fontWeight: FontWeight.w200, fontFamily: Styles.FontFamily);


  static TextStyle boldTextStyle = TextStyle(
      fontSize: fontSize33,
      fontWeight: FontWeight.w700,
      fontFamily: Styles.FontFamilyBold,
      color: colorPrimary);


  static InputDecoration formInputDecoration = InputDecoration(
      border: InputBorder.none, filled: true, fillColor: Colors.white);
  static AppBar pharmaAppBar = AppBar(
    iconTheme: IconThemeData(
      color: Colors.black, //change your color here
    ),
    // backgroundColor: Styles.colorBackGround,
  );



  static InputDecoration borderedRoundedFieldDecoration({double radius = 40}) =>
      formInputDecoration.copyWith(

          border: roundedOutlineInputBorder(radius: radius),
          focusedBorder: roundedOutlineInputBorder(radius: radius),
          enabledBorder: roundedOutlineInputBorder(radius: radius),
          errorBorder: roundedOutlineInputBorder(radius: radius)
              .copyWith(borderSide: BorderSide(color: Colors.red)),
          focusedErrorBorder: roundedOutlineInputBorder(radius: radius)
              .copyWith(borderSide: BorderSide(color: Colors.red)),
          disabledBorder: roundedOutlineInputBorder(radius: radius),
          contentPadding: EdgeInsets.all(10),
          filled: true,
          fillColor: Colors.white);


  static InputBorder roundedTransparentBorder({double radius = 40}) =>
      OutlineInputBorder(
        // borderSide: const BorderSide(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(radius),
      );

  static InputBorder roundedOutlineInputBorder({double radius = 40}) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          // color: Styles.colorPrimary,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(radius),
      );

  ///
  ///
  /// Colors

  static const ColorGray = Color(0xFFCBCFD3);

  ///
  /// Bottom navigation
  static TextStyle bottomNavigationStyle = TextStyle(color: colorPrimary);
  static Color bottomNavigationSelectedIconColor = colorPrimary;
  static const BottomNavigationUnselectedIconColor = ColorGray;



  }

abstract class CommonSizes {
  /// Mozzaik application sizes
  static const TINY_LAYOUT_W_GAP = 10.0;
  static const SMALL_LAYOUT_W_GAP = 25.0;
  static const MED_LAYOUT_W_GAP = 50.0;
  static const BIG_LAYOUT_W_GAP = 75.0;
  static const BIGGER_LAYOUT_W_GAP = 100.0;
  static const BIGGEST_LAYOUT_W_GAP = 125.0;
  static const BORDER_RADIUS_STANDARD = 15.0;
  static const BORDER_RADIUS_CORNERS_BIG = 18.0;

  static final appBarHeight = 120.h;

  static final navBarHeight = 120.h;

  /// --------------- ///
  static final vSmallestSpace5v = SizedBox(height: 5.h);
  static final vSmallestSpace = SizedBox(height: 10.h);
  static final vSmallerSpace = SizedBox(height: 20.h);
  static final vSmallSpace = SizedBox(height: 30.h);
  static final vBigSpace = SizedBox(height: 40.h);
  static final vBiggerSpace = SizedBox(height: 50.h);
  static final vBiggestSpace = SizedBox(height: 60.h);
  static final vLargeSpace = SizedBox(height: 70.h);
  static final vLargerSpace = SizedBox(height: 80.h);
  static final vLargestSpace = SizedBox(height: 90.h);
  static final vHugeSpace = SizedBox(height: 100.h);

  static final hSmallestSpace = SizedBox(width: 10.w);
  static final hSmallerSpace = SizedBox(width: 20.w);
  static final hSmallSpace = SizedBox(width: 30.w);
  static final hBigSpace = SizedBox(width: 40.w);
  static final hBiggerSpace = SizedBox(width: 50.w);
  static final hBiggestSpace = SizedBox(width: 60.w);
  static final hLargeSpace = SizedBox(width: 70.w);
  static final hLargerSpace = SizedBox(width: 80.w);
  static final hLargestSpace = SizedBox(width: 90.w);
  static final hHugeSpace = SizedBox(width: 100.w);

  static const divider = const Divider(thickness: 10);
}
