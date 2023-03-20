import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pallery/app/dimens.dart';
import 'package:pallery/gen/assets.gen.dart';
import 'package:pallery/mindfulness/view/mindfulness_view.dart';
import 'package:pallery/model/mindfulness/mindfulness.dart';

class MindfulnessProgramView extends StatelessWidget {
  const MindfulnessProgramView({super.key, required this.programs});
  final List<MindfulnessProgram> programs;

  static final gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: const [0.1, 0.3, 0.45, 0.6, 0.7],
    colors: [
      kDarkColor.withOpacity(0.3),
      kDarkColor.withOpacity(0.5),
      kDarkColor.withOpacity(0.6),
      kDarkColor.withOpacity(0.7),
      kDarkColor,
    ],
  );

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return DecoratedBox(
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
                gradient: MindfulnessProgramView.gradient,
              ),
              width: MediaQuery.of(context).size.width,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(Dimens.lg),
                        child: Row(
                          children: [
                            Text(
                              'Good night',
                              style: textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: Dimens.lg),
                        child: Text(
                          DateFormat('dd MMMM, yyyy').format(DateTime.now()),
                          style: textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(Dimens.lg),
                            child: Text(
                              'Programmation',
                              style: textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                          ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(Corners.sm),
                                    bottomLeft: Radius.circular(Corners.sm),
                                  ),
                                ),
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.only(right: Dimens.lg),
                              child: const Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding:
                              const EdgeInsets.symmetric(horizontal: Dimens.lg),
                          shrinkWrap: true,
                          itemCount: programs.length,
                          itemBuilder: (context, pos) {
                            final program = programs[pos];
                            return SizedBox(
                              height: Dimens.xl * 2,
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        height: Dimens.lg,
                                        width: 1,
                                        color:
                                            pos == 0 ? null : Colors.grey[700],
                                      ),
                                      SizedBox(
                                        width: Dimens.xl,
                                        height: Dimens.xl,
                                        child: Stack(
                                          children: [
                                            CircleAvatar(
                                              radius: Dimens.lg,
                                              child: Icon(
                                                IconData(
                                                  program.iconCodePoint!,
                                                  fontFamily:
                                                      program.fontFamily,
                                                ),
                                                size: Dimens.med,
                                              ),
                                            ),
                                            if (pos == 0)
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Container(
                                                  width: Dimens.sm,
                                                  height: Dimens.sm,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.green,
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: Dimens.lg,
                                        width: 1,
                                        color: pos == programs.length - 1
                                            ? null
                                            : Colors.grey[700],
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Opacity(
                                      opacity: pos == 0 ? 1 : 0.5,
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: Dimens.lg,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  program.name ?? '',
                                                  style: textTheme.bodyMedium
                                                      ?.copyWith(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              pos == 0 ? 'In progress' : 'Todo',
                                              style: textTheme.labelMedium
                                                  ?.copyWith(
                                                color: Colors.grey[400],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    DateFormat('hh:mm a').format(
                                      DateTime.now().add(
                                        Duration(hours: pos),
                                      ),
                                    ),
                                    style: textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: pos == 0
                                          ? Colors.white
                                          : Colors.white54,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
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
    );
  }
}
