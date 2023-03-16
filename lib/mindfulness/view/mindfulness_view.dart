import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pallery/app/app.dart';
import 'package:pallery/gen/assets.gen.dart';

const kLightColor1 = Color.fromRGBO(184, 224, 238, 0.7);
const kLightColor2 = Color.fromRGBO(227, 217, 181, 0.5);

const kDarkColor = Color.fromRGBO(23, 36, 60, 1);
const kBottomBarBgColor = Color.fromRGBO(18, 28, 49, 1);

const kActiveDotRadius = 2.0;

class MindfulnessPage extends StatefulWidget {
  const MindfulnessPage({super.key});

  @override
  State<MindfulnessPage> createState() => _MindfulnessPageState();
}

class _MindfulnessPageState extends State<MindfulnessPage> {
  int selectedTab = 0;

  void onTabChanged(int index) {
    if (index != selectedTab) {
      setState(() {
        selectedTab = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTab,
        onTap: onTabChanged,
        items: [
          BottomNavigationBarItem(
            icon: const SizedBox(
              height: Dimens.lg * 3,
              child: Icon(FontAwesomeIcons.house),
            ),
            label: 'Home',
            activeIcon: Column(
              children: const [
                SizedBox(
                  height: Dimens.lg * 3,
                  child: Icon(FontAwesomeIcons.house),
                ),
                CircleAvatar(
                  radius: kActiveDotRadius,
                  backgroundColor: Colors.orange,
                ),
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: const SizedBox(
              height: Dimens.lg * 3,
              child: Icon(
                FontAwesomeIcons.moon,
              ),
            ),
            label: 'Night',
            activeIcon: Column(
              children: const [
                SizedBox(
                  height: Dimens.lg * 3,
                  child: Icon(FontAwesomeIcons.moon),
                ),
                CircleAvatar(
                  radius: kActiveDotRadius,
                  backgroundColor: Colors.orange,
                ),
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: const SizedBox(
              height: Dimens.lg * 3,
              child: Icon(
                FontAwesomeIcons.user,
              ),
            ),
            label: 'Person',
            activeIcon: Column(
              children: const [
                SizedBox(
                  height: Dimens.lg * 3,
                  child: Icon(FontAwesomeIcons.user),
                ),
                CircleAvatar(
                  radius: kActiveDotRadius,
                  backgroundColor: Colors.orange,
                ),
              ],
            ),
          ),
        ],
        backgroundColor: kBottomBarBgColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white,
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.mindfulnessBg.path),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Opacity(
              opacity: 0.85,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.1, 0.3, 0.45, 0.6, 0.7],
                    colors: [
                      kLightColor1,
                      kLightColor2,
                      Colors.transparent,
                      kDarkColor.withOpacity(0.7),
                      kDarkColor,
                    ],
                  ),
                ),
                width: MediaQuery.of(context).size.width,
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(Dimens.lg),
                          child: Text(
                            'Welcome, Chris',
                            style: textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: Dimens.lg),
                          child: Text(
                            DateFormat('dd MMMM, yyyy').format(DateTime.now()),
                            style: textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Card(
                          margin: const EdgeInsets.all(Dimens.lg),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Dimens.med),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.all(Dimens.lg + Dimens.xs),
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
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(Dimens.lg),
                          child: Text(
                            'What do you need today?',
                            style: textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            bottom: Dimens.xl,
                          ),
                          child: CarouselSlider.builder(
                            itemCount: 3,
                            itemBuilder: (context, pos, idx) {
                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(Dimens.med),
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
                                                style: textTheme.bodySmall
                                                    ?.copyWith(
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
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
