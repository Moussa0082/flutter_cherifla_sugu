// import 'dart:html';

import 'package:cheriflasugu/widgets/text_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}
     

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextController =
      TextEditingController(text: "");
  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              RichText(
                text: TextSpan(
                  text: 'Salut, ',
                  style: const TextStyle(
                    color: Colors.cyan,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Moussa Bane',
                        style: TextStyle(
                          color: color,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('Mon nom est cliqué');
                          }),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextWidget(
                text: 'bane8251@gmail.com',
                color: color,
                textSize: 14,
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 20,
              ),
              _listTiles(
                title: 'Adresse 2',
                subtitle: 'sous-titre',
                icon: IconlyLight.profile,
                onPressed: () async {
                  await _showAddresseDialog();
                },
                color: color,
              ),
              _listTiles(
                title: 'Commandes',
                icon: IconlyLight.bag,
                onPressed: () async {},
                color: color,
              ),
              _listTiles(
                title: 'Favoris',
                icon: IconlyLight.heart,
                onPressed: () {},
                color: color,
              ),
              _listTiles(
                title: 'Vu',
                icon: IconlyLight.show,
                onPressed: () {},
                color: color,
              ),
              _listTiles(
                title: 'Mot de passe oublier',
                icon: IconlyLight.unlock,
                onPressed: () {},
                color: color,
              ),
              SwitchListTile(
                title: TextWidget(
                  text: themeState.getDarkTheme ? 'Dark mode ' : 'Light mode',
                  color: color,
                  textSize: 18,
                ),
                secondary: Icon(themeState.getDarkTheme
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined),
                onChanged: (bool value) {
                  setState(() {
                    themeState.setDarkTheme = value;
                  });
                },
                value: themeState.getDarkTheme,
              ),
              _listTiles(
                title: 'Déconnection',
                icon: IconlyLight.logout,
                onPressed: () {
                  _showLogoutDialog();
                },
                color: color,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  //deconnection methode
  Future<void> _showLogoutDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(children: [
              Image.asset(
                'assets/images/warning-sign.png',
                height: 20,
                width: 20,
                fit: BoxFit.fill,
              ),
               const Text('Deconnection') 
            ]),
          );
        });
  }

//modifier adresse methode
  Future<void> _showAddresseDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Modifier'),
            content: TextField(
              // onChanged: (value) {
              // _addressTextController.text;
              // },
              controller: _addressTextController,
              maxLines: 5,
              decoration: const InputDecoration(hintText: "Votre adresse"),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text('Modifier'),
              ),
            ],
          );
        });
  }

// const  ListTile(
  Widget _listTiles({
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
    required Color color,
  }) {
    return ListTile(
        title: TextWidget(
          text: title,
          color: color,
          textSize: 22,
          // isTitle: true,
          // style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        subtitle: TextWidget(
          text: subtitle == null ? "" : subtitle,
          color: color,
          textSize: 18,
        ),
        leading: Icon(icon),
        trailing: const Icon(IconlyLight.arrowDown2),
        onTap: () {
          onPressed();
        });
  }
}
