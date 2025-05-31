import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/create/create.dart';
import 'package:flutter_rpg/screens/home/character_card.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';

import '../../models/character.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {

  void openCreateScreen() async {
    final newCharacter = await Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => const Create()),
    );

    if (newCharacter != null && newCharacter is Character) {
      setState(() {
        characters.add(newCharacter);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const StyledTitle("Your characters")),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: characters.length,
                  itemBuilder: (_, index) {
                    return CharacterCard(characters[index]);
                  },
                ),
              ),
              StyledButton(
                onPressed: openCreateScreen,
                child: const StyledHeading("Create new"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
