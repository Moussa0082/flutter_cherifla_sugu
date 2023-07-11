import 'package:cheriflasugu/const/theme_data.dart';
import 'package:cheriflasugu/provider/dark_theme_provider.dart';
import 'package:cheriflasugu/screens/btm_bar.dart';
// import 'package:cheriflasugu/screens/home_screen.dart';  
// import 'dart:html';      
import "package:flutter/material.dart";
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}
                                        
class MyApp extends StatefulWidget {  
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
                                                                                
class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  // This widget is the root of your application.
  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        })
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            // title: 'Flutter Demo',
            title: 'Bane_Market',
            theme: Styles.themeData(themeProvider.getDarkTheme, context),
            home: const BottomBarScreen());
      }),
    );
  }
}
