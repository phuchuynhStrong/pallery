import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pallery/app/routes.dart';
import 'package:pallery/gen/assets.gen.dart';
import 'package:pallery/l10n/l10n.dart';
import 'package:rive/rive.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView>
    with TickerProviderStateMixin {
  late final AnimationController scaledController;
  late final AnimationController textAnimationController;

  @override
  void initState() {
    scaledController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )
      ..animateTo(1, curve: Curves.easeInOutCubicEmphasized)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          textAnimationController.animateTo(1);
        }
      });
    textAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      upperBound: 3,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    scaledController.dispose();
    textAnimationController.dispose();
    super.dispose();
  }

  void onGetStartedPressed() {
    context.goNamed(RouteName.productList.value);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const buttonWidth = 200.0;
    const buttonHeight = 48.0;
    final scaleRatio = scaledController.value;
    final secondaryTextStyle = GoogleFonts.getFont(
      'Exo',
      fontSize: 36,
      fontWeight: FontWeight.w200,
      letterSpacing: -1,
    );
    final primaryTextStyle = GoogleFonts.getFont(
      'Exo',
      fontSize: 48,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      body: Stack(
        children: [
          Align(
            child: RiveAnimation.asset(
              Assets.animation.starryStarryNight,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultTextStyle(
                      style: secondaryTextStyle,
                      child: AnimatedTextKit(
                        isRepeatingAnimation: false,
                        animatedTexts: [
                          TypewriterAnimatedText('Talk is'),
                        ],
                      ),
                    ),
                    if (textAnimationController.value >= 1)
                      DefaultTextStyle(
                        style: primaryTextStyle,
                        child: AnimatedTextKit(
                          isRepeatingAnimation: false,
                          onFinished: () {
                            textAnimationController.animateTo(2);
                          },
                          animatedTexts: [
                            TypewriterAnimatedText('Cheap'),
                          ],
                        ),
                      ),
                  ],
                ),
                if (textAnimationController.value >= 2)
                  DefaultTextStyle(
                    style: secondaryTextStyle,
                    child: AnimatedTextKit(
                      isRepeatingAnimation: false,
                      onFinished: () {
                        textAnimationController.animateTo(3);
                      },
                      animatedTexts: [
                        TypewriterAnimatedText('Show me the'),
                      ],
                    ),
                  ),
                if (textAnimationController.value >= 3)
                  DefaultTextStyle(
                    style: primaryTextStyle,
                    child: AnimatedTextKit(
                      isRepeatingAnimation: false,
                      animatedTexts: [
                        TypewriterAnimatedText('Code'),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Positioned(
            bottom: scaleRatio * buttonHeight,
            top: (size.height - buttonHeight * 2) * scaleRatio,
            left: ((size.width - buttonWidth) / 2) * scaleRatio,
            right: ((size.width - buttonWidth) / 2) * scaleRatio,
            child: Container(
              width: (size.width - buttonWidth) * scaleRatio,
              height: (size.height - buttonHeight) * scaleRatio,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xff3278e4),
              ),
              alignment: Alignment.center,
              child: scaleRatio == 1
                  ? InkWell(
                      onTap: onGetStartedPressed,
                      child: Text(
                        context.l10n.getStarted,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
