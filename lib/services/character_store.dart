import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rpg/services/firestore_service.dart';

import '../models/character.dart';

class CharacterStore extends ChangeNotifier {
  final List<Character> _characters = [];

  List<Character> get characters => _characters;

  // add character
  void addCharacter(Character character) {
    FirestoreService.addCharacter(character);
    _characters.add(character);
    notifyListeners();
  }
  // save (update) character
  Future<void> saveCharacter(Character character) async {
    await FirestoreService.updateCharacter(character);
    return;
  }

  // remove character
  Future<void> deleteCharacter(Character character) async {
    await FirestoreService.deleteCharacter(character);
    _characters.remove(character);
    notifyListeners();
  }

  // initially fetch characters
  void fetchCharactersOnce() async {
    if(characters.isEmpty){
      final QuerySnapshot<Character> snapshot = await FirestoreService.getCharactereOnce();

      for (var doc in snapshot.docs){
        _characters.add(doc.data());
      }
      notifyListeners();
    }
  }
}
