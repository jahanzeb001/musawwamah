import 'package:flutter/material.dart';

class ColorManager {
  static Color lightgrey = Color.fromARGB(255, 63, 61, 61);
  static Color mediumgrey = Colors.grey.withOpacity(0.1);
  static Color grey = Colors.grey;
  static Color deeppurple = Colors.deepPurple;

  /// MAin Colors
  static Color primaryColor = Color(0XFF97a8a8);
  static Color secondaryColor = Color(0XFF717880);

  static Color lightcolor = Color(0XFFe8eaea);
  static Color black = HexColor.fromHex('#000000');
  static Color white = HexColor.fromHex('#FFFFFF');

  static List<BoxShadow> boxShadow() {
    return [
      BoxShadow(
        color: Colors.black.withOpacity(0.5),
        spreadRadius: 1,
        blurRadius: 0.5,
        offset: Offset(0, 2), // changes position of shadow
      ),
    ];
  }
}

List<BoxShadow> containerboxShadow() {
  return [
    BoxShadow(
      color: Color(0XFFA4A4A4).withOpacity(0.5),
      spreadRadius: 0,
      blurRadius: 0.3,
      offset: Offset(0, 0), // changes position of shadow
    ),
  ];
}

List<BoxShadow> userContainerboxShadow() {
  return [
    BoxShadow(
      color: Color(0XFF000000).withOpacity(0.12),
      blurRadius: 6.0,
      spreadRadius: 1,
      offset: Offset(
        -2.0, // Move to right 7.0 horizontally
        15.0,
        //Move to Bottom
      ),
    )
  ];
}

List<BoxShadow> containerlightboxShadow() {
  return [
    BoxShadow(
      color: Color(0XFF000000).withOpacity(0.07),
      blurRadius: 2.0,
      spreadRadius: 0.1,
      offset: Offset(
        -1.0, // Move to right 7.0 horizontally
        2.0,
        //Move to Bottom
      ),
    )
  ];
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF' + hexColorString;
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}

const String dummyimage =
    'https://images.unsplash.com/photo-1600948836101-f9ffda59d250?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=836&q=80';
const Color cappbarcolor = Color(0XFF151515);
const Color cdashboardheadingcolor = Color(0XFF454545);
const Color backgroundColor = Color(0XFFF9F9F9);
const Color ratingcolor = Color(0XFFF5E072);
const Color white = Color(0XFFFFFFFF);
const Color black = Color(0XFF545454);
const Color red = Colors.red;
const Color greentextgraient = Color(0XFF227B69);
const Color bluetextgraient = Color(0XFF586E71);
const Color redtextgraient = Color(0XFFB64D3F);
const Color netearningtext = Color(0XFF717880);
const Color primarycolor = Color(0XFF717880);
const Color lightprimarycolor = Color(0XFF97A8A8);
const Color lightblue = Color(0XFF697B90);
const Color offwhite = Color(0XFFF1F1F1);
const Color cancelled = Color(0XFFB64D3F);
const Color green = Color(0XFF227B69);
const Color greylight = Color(0XFFC2C2C2);
const Color primaryColor = Color(0XFF97a8a8);
Color logoutbuttoncolor = Color(0XFF697B90).withOpacity(0.25);
const Color appBarTextColor = Color(0xFF545454);
const Color scaffoldBookingScreenColor = Color(0xFFE5E5E5);
const Color textColor = Color(0xFF696969);
const Color textColorTwo = Color(0xFF999999);
const Color dividerSelectedColor = Color(0xFFEEEEEE);
const Color borderColor = Color(0xFFD8D8D8);
const Color textHintColor = Color(0xFFC6C6C6);
const Color textColorThree = Color(0xFF717880);

/// THIS IS THE CLASS FOR MANAGE COLORS USED IN THE APPLICATION...

class ColorUtilities {
  /// PRIMARY COLORS...
  static final Color primary_050 = Color(0xFFE8EBF4);
  static final Color primary_100 = Color(0xFFC0B8F4);
  static final Color primary_200 = Color(0xFFABA1F1);
  static final Color primary_300 = Color(0xFF9789ED);
  static final Color primary_400 = Color(0xFF8272EA);
  static final Color primary_500 = Color(0xFF6D5AE6);
  static final Color primary_600 = Color(0xFF5843E3);
  static final Color primary_700 = Color(0xFF432BDF);
  static final Color primary_800 = Color(0xFF3A22D3);
  static final Color primary_900 = Color(0xFF2C15C1);

  /// TEXT COLORS...
  static final Color text_100 = Color(0xFFDFDEE4);
  static final Color text_200 = Color(0xFFC6C5CD);
  static final Color text_300 = Color(0xFFABAAB1);
  static final Color text_400 = Color(0xFF89888E);
  static final Color text_500 = Color(0xFF5E5D65);
  static final Color text_600 = Color(0xFF454354);
  static final Color text_700 = Color(0xFF302E43);
  static final Color text_800 = Color(0xFF252339);
  static final Color text_900 = Color(0xFF191632);

  /// DARK COLORS...
  static final Color dark_100 = Color(0xFFA2A6B1);
  static final Color dark_200 = Color(0xFF797D8A);
  static final Color dark_300 = Color(0xFF6C707D);
  static final Color dark_400 = Color(0xFF626673);
  static final Color dark_500 = Color(0xFF565A66);
  static final Color dark_600 = Color(0xFF484C57);
  static final Color dark_700 = Color(0xFF3C404A);
  static final Color dark_800 = Color(0xFF2D3039);
  static final Color dark_900 = Color(0xFF242731);

  /// LIGHT COLORS...

  static final Color light_100 = Color(0xFFFDFDFD);
  static final Color light_200 = Color(0xFFFBFBFB);
  static final Color light_300 = Color(0xFFF8F8F8);
  static final Color light_400 = Color(0xFFF6F6F6);
  static final Color light_500 = Color(0xFFF4F4F4);
  static final Color light_600 = Color(0xFFF2F2F2);
  static final Color light_700 = Color(0xFFEFEFEF);
  static final Color light_800 = Color(0xFFEDEDED);
  static final Color light_900 = Color(0xFFEBEBEB);

  /// GREEN COLORS...
  static final Color green_100 = Color(0xFFEDFDD4);
  static final Color green_200 = Color(0xFFD6FCAA);
  static final Color green_300 = Color(0xFFB7F67E);
  static final Color green_400 = Color(0xFF98EE5D);
  static final Color green_500 = Color(0xFF6BE42B);
  static final Color green_600 = Color(0xFF4DC41F);
  static final Color green_700 = Color(0xFF34A415);
  static final Color green_800 = Color(0xFF20840D);
  static final Color green_900 = Color(0xFF116D08);

  /// YELLOW COLORS...
  static final Color yellow_100 = Color(0xFFFFF5D6);
  static final Color yellow_200 = Color(0xFFFFE7AE);
  static final Color yellow_300 = Color(0xFFFFD686);
  static final Color yellow_400 = Color(0xFFFFC668);
  static final Color yellow_500 = Color(0xFFFFAB36);
  static final Color yellow_600 = Color(0xFFDB8827);
  static final Color yellow_700 = Color(0xFFB7681B);
  static final Color yellow_800 = Color(0xFF934C11);
  static final Color yellow_900 = Color(0xFF7A380A);

  /// RED COLORS...
  static final Color red_100 = Color(0xFFFEE3D5);
  static final Color red_200 = Color(0xFFFEC1AC);
  static final Color red_300 = Color(0xFFFD9782);
  static final Color red_400 = Color(0xFFFC7063);
  static final Color red_500 = Color(0xFFFB3030);
  static final Color red_600 = Color(0xFFD72332);
  static final Color red_700 = Color(0xFFB41833);
  static final Color red_800 = Color(0xFF910F31);
  static final Color red_900 = Color(0xFF78092F);

  /// STATIC COLORS...
  static final Color transparant = Color(0x00000000);
  static final Color black = Color(0xFF000000);
  static final Color white = Color(0xFFFFFFFF);
}
