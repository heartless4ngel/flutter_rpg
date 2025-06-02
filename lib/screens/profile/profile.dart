import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/profile/skill_list.dart';
import 'package:flutter_rpg/screens/profile/stats_table.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

import '../../models/character.dart';

class Profile extends StatelessWidget {
  final Character character;

  const Profile({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledTitle(character.name)),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //basic info - image, vocation, description
              Container(
                padding: const EdgeInsets.all(16),
                color: AppColors.secondaryColor.withValues(alpha: 0.3),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/img/vocations/${character.vocation.image}",
                      width: 140,
                      height: 140,
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StyledHeading(character.vocation.title),
                          StyledText(character.vocation.description),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 20),
              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),

              //weapon, ability and slogan
              Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  color: AppColors.secondaryColor.withValues(alpha: 0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const StyledHeading("Slogan"),
                      StyledText(character.slogan),
                      const SizedBox(height: 10),

                      const StyledHeading("Weapon of Choice"),
                      StyledText(character.vocation.weapon),
                      const SizedBox(height: 10),

                      const StyledHeading("Unique Ability"),
                      StyledText(character.vocation.ability),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              //stats & skills
              StatsTable(character),
              SkillList(character),

              // save button
              StyledButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const StyledHeading("Character was saved"),
                      showCloseIcon: true,
                      duration: const Duration(seconds: 2),
                      backgroundColor: AppColors.secondaryColor,
                    ),
                  );
                },
                child: const StyledHeading("Save Character"),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
