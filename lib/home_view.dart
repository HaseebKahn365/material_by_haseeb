import 'package:flutter/material.dart';

/*This project is going to contain most of the beautiful widgets and components from the flutter Animation app and the flutter plugin app.
Here is the list of the widgets that we are going to cover in this project.

From the flutter animations app:
Icon Animations : Responsive Icon 
Loop Animation : Ripple Animation
Button Animation : Progress Button 1
Animated List view 3
Other Animations: Expandable widget

from the flutter plugin app:
Plugins for cards: FlibCard Animation
Plugins for buttons: Like Button, Spring Button


After all this we will implement a custom widget that will use the hover of the mouse to display cool randomizing text with glow of the cursor.
 */

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    //this is the home view that will contain all the buttons to launch the widgets
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //this is the button to launch the responsive icon widget
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/responsive_icon');
              },
              child: const Text('Responsive Icon'),
            ),
            //this is the button to launch the ripple animation widget
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ripple_animation');
              },
              child: const Text('Ripple Animation'),
            ),
            //this is the button to launch the progress button 1 widget
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/progress_button_1');
              },
              child: const Text('Progress Button 1'),
            ),
            //this is the button to launch the animated list view 3 widget
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/animated_list_view_3');
              },
              child: const Text('Animated List View 3'),
            ),
            //this is the button to launch the expandable widget
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/expandable_widget');
              },
              child: const Text('Expandable Widget'),
            ),
            //this is the button to launch the flib card animation widget
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/flib_card_animation');
              },
              child: const Text('Flib Card Animation'),
            ),
            //this is the button to launch the like button widget
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/like_button');
              },
              child: const Text('Like Button'),
            ),
            //this is the button to launch the spring button widget
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/spring_button');
              },
              child: const Text('Spring Button'),
            ),
            //this is the button to launch the hover text widget
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/hover_text');
              },
              child: const Text('Hover Text'),
            ),
          ],
        ),
      ),
    );
  }
}
