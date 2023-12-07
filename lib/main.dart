import 'package:flutter/material.dart';
import 'package:material_by_haseeb/home_view.dart';

//I am gonna customize this app to be my portfolio
void main() {
  runApp(const Material3Demo());
}

class Material3Demo extends StatefulWidget {
  const Material3Demo({super.key});

  @override
  State<Material3Demo> createState() => _Material3DemoState();
}

const double narrowScreenWidthThreshold = 450;

const Color m3BaseColor = Color(0xff6750a4);
const List<Color> colorOptions = [
  m3BaseColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
  Colors.lime
];
const List<String> colorText = <String>[
  "M3 Baseline",
  "Blue",
  "Teal",
  "Green",
  "Yellow",
  "Orange",
  "Pink",
  "Lime"
];

class _Material3DemoState extends State<Material3Demo> {
  bool useMaterial3 = true;
  bool useLightMode = true;
  int colorSelected = 0;
  int screenIndex = 0;

  late ThemeData themeData;

  @override
  initState() {
    super.initState();
    themeData = updateThemes(colorSelected, useMaterial3, useLightMode);
  }

  ThemeData updateThemes(int colorIndex, bool useMaterial3, bool useLightMode) {
    return ThemeData(
        // make the new Product Sans font the default font
        fontFamily: 'Product Sans',
        colorSchemeSeed: colorOptions[colorSelected],
        useMaterial3: useMaterial3,
        brightness: useLightMode ? Brightness.light : Brightness.dark);
  }

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      screenIndex = selectedScreen;
    });
  }

  void handleBrightnessChange() {
    setState(() {
      useLightMode = !useLightMode;
      themeData = updateThemes(colorSelected, useMaterial3, useLightMode);
    });
  }

  void handleMaterialVersionChange() {
    setState(() {
      useMaterial3 = !useMaterial3;
      themeData = updateThemes(colorSelected, useMaterial3, useLightMode);
    });
  }

  void handleColorSelect(int value) {
    setState(() {
      colorSelected = value;
      themeData = updateThemes(colorSelected, useMaterial3, useLightMode);
    });
  }

  PreferredSizeWidget createAppBar() {
    return AppBar(
      //Make the title appear larger if on desktop(use responsive builder) and also bring it to the center
      title: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < narrowScreenWidthThreshold) {
          return const Text("Haseeb's Portfolio");
        } else {
          return const Text("Haseeb's  Portfolio",
              style: TextStyle(fontSize: 35, letterSpacing: 1));
        }
      }),
      //center if on desktop
      centerTitle:
          (MediaQuery.of(context).size.width > narrowScreenWidthThreshold)
              ? true
              : false,

      actions: [
        IconButton(
          icon: useLightMode
              ? const Icon(Icons.wb_sunny_outlined)
              : const Icon(Icons.wb_sunny),
          onPressed: handleBrightnessChange,
          tooltip: "Light/Dark Mode",
        ),
        PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          itemBuilder: (context) {
            return List.generate(colorOptions.length, (index) {
              return PopupMenuItem(
                  value: index,
                  child: Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(
                          index == colorSelected
                              ? Icons.color_lens
                              : Icons.color_lens_outlined,
                          color: colorOptions[index],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(colorText[index]))
                    ],
                  ));
            });
          },
          onSelected: handleColorSelect,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    //I want the boyinspace.jpg to be the background image
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      themeMode: useLightMode ? ThemeMode.light : ThemeMode.dark,
      theme: themeData,
      home: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < narrowScreenWidthThreshold) {
          return Scaffold(
            appBar: createAppBar(),
            body: HomeBody(),
          );
        } else {
          return Scaffold(
            appBar: createAppBar(),
            body: HomeBody(),
          );
        }
      }),
    );
  }
}
