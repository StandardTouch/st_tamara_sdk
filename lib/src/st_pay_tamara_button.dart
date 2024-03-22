import 'package:flutter/material.dart';
import 'package:st_tamara_sdk/src/styles/constants.dart';
import 'package:st_tamara_sdk/src/styles/text_styles.dart';

enum TamaraButtonStyle { base, gradient }

class STPayTamaraButton extends StatefulWidget {
  const STPayTamaraButton({
    super.key,
    this.tamaraButtonStyle = TamaraButtonStyle.base,
    this.buttonIsArabic = false,
    this.width,
  });

  final TamaraButtonStyle tamaraButtonStyle;
  final bool buttonIsArabic;

  final double? width;

  @override
  State<STPayTamaraButton> createState() => _STPayTamaraButtonState();
}

class _STPayTamaraButtonState extends State<STPayTamaraButton> {
  String getTamaraLogo(
      {required TamaraButtonStyle buttonStyle, required bool buttonIsArabic}) {
    if (buttonStyle == TamaraButtonStyle.base && buttonIsArabic) {
      return Constants.baseLogoAr;
    } else if (buttonStyle == TamaraButtonStyle.base && !buttonIsArabic) {
      return Constants.baseLogoEn;
    } else if (buttonStyle == TamaraButtonStyle.gradient && buttonIsArabic) {
      return Constants.gradientLogoAr;
    } else {
      return Constants.gradientLogoEn;
    }
  }

  double getBorderRadius({required TamaraButtonStyle buttonStyle}) {
    if (buttonStyle == TamaraButtonStyle.base) {
      return 8;
    } else {
      return 18;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(getBorderRadius(
        buttonStyle: widget.tamaraButtonStyle,
      )),
      onTap: () {},
      child: Ink(
        width: widget.width ?? 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 6,
              child: FittedBox(
                child: Text(
                  "Pay with",
                  style: TextStyles.black,
                ),
              ),
            ),
            Expanded(flex: 1, child: SizedBox.shrink()),
            Expanded(
              flex: 10,
              child: Image.asset(
                getTamaraLogo(
                  buttonStyle: widget.tamaraButtonStyle,
                  buttonIsArabic: widget.buttonIsArabic,
                ),
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
