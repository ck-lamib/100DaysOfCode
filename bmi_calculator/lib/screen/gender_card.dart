import 'package:bmi_calculator/common/card_title.dart';
import 'package:bmi_calculator/utils/gender.dart';
import 'package:bmi_calculator/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_svg/flutter_svg.dart';

class GenderCard extends StatefulWidget {
  final Gender? intitialGender;
  const GenderCard({super.key, this.intitialGender});

  @override
  State<GenderCard> createState() => _GenderCardState();
}

class _GenderCardState extends State<GenderCard> {
  Gender? selectedGender;
  @override
  void initState() {
    selectedGender = widget.intitialGender ?? Gender.other; //<--- initialize selected gender
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: screenAwareSize(8, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const CardTitle(title: "Gender"),
              Padding(
                padding: EdgeInsets.only(top: screenAwareSize(16.0, context)),
                child: _drawMainStack(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawMainStack() {
    return SizedBox(
      width: double.infinity, //<--- Expand stack width
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          _drawCircleIndicator(),
          const GenderIconTranslated(gender: Gender.other),
          const GenderIconTranslated(gender: Gender.male),
          const GenderIconTranslated(gender: Gender.female),
          _drawGestureDetector(), //<--- Add gesutre detector
        ],
      ),
    );
  }

  Widget _drawCircleIndicator() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        const GenderCircle(),
        GenderArrow(angle: _genderAngles[selectedGender]!), //<--- make arrow display current gender
      ],
    );
  }

  _drawGestureDetector() {
    return Positioned.fill(
      child: TapHandler(
        onGenderTapped: (gender) => setState(() => selectedGender = gender),
      ),
    );
  }
}

//For center circle

double _circleSize(BuildContext context) => screenAwareSize(80.0, context);

class GenderCircle extends StatelessWidget {
  const GenderCircle({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: _circleSize(context),
      height: _circleSize(context),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(244, 244, 244, 1.0),
      ),
    );
  }
}

//For gender icon

class GenderLine extends StatelessWidget {
  const GenderLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: screenAwareSize(6.0, context),
        top: screenAwareSize(8.0, context),
      ),
      child: Container(
        height: screenAwareSize(8.0, context),
        width: 1.0,
        color: const Color.fromRGBO(216, 217, 223, 0.54),
      ),
    );
  }
}

const double _defaultGenderAngle = math.pi / 4;
const Map<Gender, double> _genderAngles = {
  Gender.female: -_defaultGenderAngle,
  Gender.other: 0.0,
  Gender.male: _defaultGenderAngle,
};

class GenderIconTranslated extends StatelessWidget {
  static final Map<Gender, String> _genderImages = {
    Gender.female: "assets/images/gender_female.svg",
    Gender.other: "assets/images/gender_other.svg",
    Gender.male: "assets/images/gender_male.svg",
  };

  final Gender gender;

  const GenderIconTranslated({super.key, required this.gender});

  bool get _isOtherGender => gender == Gender.other;

  String? get _assetName => _genderImages[gender];

  double _iconSize(BuildContext context) {
    return screenAwareSize(_isOtherGender ? 22.0 : 16.0, context);
  }

  double _genderLeftPadding(BuildContext context) {
    return screenAwareSize(_isOtherGender ? 8.0 : 0.0, context);
  }

  @override
  Widget build(BuildContext context) {
    Widget icon = Padding(
      padding: EdgeInsets.only(left: _genderLeftPadding(context)),
      child: SvgPicture.asset(
        _assetName!,
        // color: const Color(0xFFFF9000),
        height: _iconSize(context),
        width: _iconSize(context),
      ),
    );

    Widget rotatedIcon = Transform.rotate(
      angle: -_genderAngles[gender]!,
      child: icon,
    );

    Widget iconWithALine = Padding(
      padding: EdgeInsets.only(bottom: _circleSize(context) / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          rotatedIcon,
          const GenderLine(),
        ],
      ),
    );

    Widget rotatedIconWithALine = Transform.rotate(
      alignment: Alignment.bottomCenter,
      angle: _genderAngles[gender]!,
      child: iconWithALine,
    );

    Widget centeredIconWithALine = Padding(
      padding: EdgeInsets.only(bottom: _circleSize(context) / 2),
      child: rotatedIconWithALine,
    );

    return centeredIconWithALine;
  }
}

//GEnder arrow

class GenderArrow extends StatelessWidget {
  final double angle;

  const GenderArrow({super.key, required this.angle});

  double _arrowLength(BuildContext context) => screenAwareSize(40, context);

  double _translationOffset(BuildContext context) => _arrowLength(context) * -0.4;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Transform.translate(
        offset: Offset(0.0, _translationOffset(context)),
        child: Transform.rotate(
          angle: -_defaultGenderAngle,
          child: SvgPicture.asset(
            "assets/images/gender_arrow.svg",
            height: _arrowLength(context),
            width: _arrowLength(context),
          ),
        ),
      ),
    );
  }
}

class TapHandler extends StatelessWidget {
  final Function(Gender) onGenderTapped;

  const TapHandler({super.key, required this.onGenderTapped});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(child: GestureDetector(onTap: () => onGenderTapped(Gender.female))),
        Expanded(child: GestureDetector(onTap: () => onGenderTapped(Gender.other))),
        Expanded(child: GestureDetector(onTap: () => onGenderTapped(Gender.male))),
      ],
    );
  }
}
