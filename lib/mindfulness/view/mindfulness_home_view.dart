import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pallery/app/dimens.dart';
import 'package:simple_animations/simple_animations.dart';

class MindfulnessHomeView extends StatefulWidget {
  const MindfulnessHomeView({super.key});

  @override
  State<MindfulnessHomeView> createState() => _MindfulnessHomeViewState();
}

class _MindfulnessHomeViewState extends State<MindfulnessHomeView>
    with AnimationMixin {
  late Animation<double> translateAnimation;
  late Animation<double> opacityAnimation;

  @override
  void initState() {
    translateAnimation = Tween<double>(
      begin: Dimens.xl,
      end: 0,
    ).animate(controller);
    opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(controller);

    controller.play(duration: const Duration(milliseconds: 300));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: Offset(0, translateAnimation.value / 2),
                  child: Container(
                    margin: const EdgeInsets.all(Dimens.lg),
                    child: Text(
                      'Welcome, buddy',
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, translateAnimation.value / 2),
                  child: Container(
                    margin: const EdgeInsets.only(left: Dimens.lg),
                    child: Text(
                      DateFormat('dd MMMM, yyyy').format(DateTime.now()),
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, translateAnimation.value),
                  child: Card(
                    margin: const EdgeInsets.all(Dimens.lg),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Dimens.med),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(Dimens.lg + Dimens.xs),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.orange,
                                radius: Dimens.med,
                                child: Icon(
                                  Icons.notifications,
                                  color: Colors.yellow,
                                  size: Dimens.lg,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  left: Dimens.med,
                                ),
                                child: Text(
                                  'Activities today',
                                  style: TextStyle(
                                    color: Colors.orange[300],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(child: Container()),
                              const Text(
                                '8:00 pm',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              top: Dimens.sm,
                            ),
                            child: const Text(
                              'Mediatation and relaxation',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
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
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: Offset(0, translateAnimation.value / 2),
                  child: Container(
                    margin: const EdgeInsets.all(Dimens.lg),
                    child: Text(
                      'What do you need today?',
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, translateAnimation.value),
                  child: Opacity(
                    opacity: opacityAnimation.value,
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: Dimens.xl,
                      ),
                      child: CarouselSlider.builder(
                        itemCount: 3,
                        itemBuilder: (context, pos, idx) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(Dimens.med),
                            ),
                            color: Colors.blueAccent[100]?.withOpacity(0.3),
                            child: Padding(
                              padding: const EdgeInsets.all(Dimens.lg),
                              child: Row(
                                children: [
                                  const Expanded(
                                    flex: 2,
                                    child: Icon(
                                      FontAwesomeIcons.personSwimming,
                                      size: Dimens.xl,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: Dimens.sm,
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Swimming',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                            top: Dimens.xs,
                                          ),
                                          child: Text(
                                            'Recommended in the morning',
                                            style:
                                                textTheme.bodySmall?.copyWith(
                                              color: Colors.grey,
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
                        },
                        options: CarouselOptions(
                          height: Dimens.lg * 7,
                          enableInfiniteScroll: false,
                          viewportFraction:
                              1 - (Dimens.xl / mediaQuery.size.width),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
