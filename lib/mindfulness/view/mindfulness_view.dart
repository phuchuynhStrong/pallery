import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pallery/app/app.dart';
import 'package:pallery/mindfulness/view/mindfulness_home_view.dart';
import 'package:pallery/mindfulness/view/mindfulness_program_view.dart';
import 'package:pallery/model/model.dart';

const kLightColor1 = Color.fromRGBO(184, 224, 238, 0.7);
const kLightColor2 = Color.fromRGBO(227, 217, 181, 0.5);

const kDarkColor = Color.fromRGBO(23, 36, 60, 1);
const kBottomBarBgColor = Color.fromRGBO(18, 28, 49, 1);

const kActiveDotRadius = 2.0;

class MindfulnessPage extends StatefulWidget {
  const MindfulnessPage({super.key});

  static final gradient = LinearGradient(
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
  );

  static final horizontalGradient = LinearGradient(
    stops: const [0.1, 0.3, 0.45, 0.6, 0.7],
    colors: [
      kLightColor1,
      kLightColor2,
      Colors.transparent,
      kDarkColor.withOpacity(0.7),
      kDarkColor,
    ],
  );

  @override
  State<MindfulnessPage> createState() => _MindfulnessPageState();
}

class _MindfulnessPageState extends State<MindfulnessPage>
    with SingleTickerProviderStateMixin {
  int selectedTab = 0;

  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void onTabChanged(int index) {
    if (index != selectedTab) {
      setState(() {
        selectedTab = index;
        tabController.animateTo(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const MindfulnessHomeView(),
          MindfulnessProgramView(
            programs: [
              MindfulnessProgram(
                id: 1,
                name: 'Reading',
                iconCodePoint: Icons.book.codePoint,
                fontFamily: 'MaterialIcons',
              ),
              MindfulnessProgram(
                id: 2,
                name: 'Bedtime',
                iconCodePoint: Icons.bed.codePoint,
                fontFamily: Icons.bed.fontFamily,
              )
            ],
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
