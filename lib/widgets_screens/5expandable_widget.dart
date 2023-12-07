import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandableWidget extends StatefulWidget {
  @override
  _ExpandableWidgetState createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget> {
  bool isTapped = true;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 300,
            ),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                setState(() {
                  isTapped = !isTapped;
                });
              },
              onHighlightChanged: (value) {
                setState(() {
                  isExpanded = value;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: isTapped
                      ? isExpanded
                          ? 65
                          : 70
                      : isExpanded
                          ? 225
                          : 230,
                  width: isExpanded ? 330 : 370,
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.5),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(20),
                  child: isTapped
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tap to Expand it',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                                Icon(
                                  isTapped
                                      ? Icons.keyboard_arrow_down
                                      : Icons.keyboard_arrow_up,
                                  size: 27,
                                ),
                              ],
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tap to Expand it',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                                Icon(
                                  isTapped
                                      ? Icons.keyboard_arrow_down
                                      : Icons.keyboard_arrow_up,
                                  color: Colors.white,
                                  size: 27,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              isTapped
                                  ? ''
                                  : 'Widgets that have global keys reparent '
                                      'their subtrees when they are moved from one '
                                      'locatved from its old location '
                                      'the tree.',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
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
    );
  }
}
