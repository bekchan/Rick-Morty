import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricknmorty/components/character_list_item.dart';
import 'package:ricknmorty/data/models/character.dart';
import 'package:ricknmorty/screens/location_screen/bloc/location_bloc.dart';
import 'package:ricknmorty/theme/color_theme.dart';

class LocationCharacters extends StatelessWidget {
  final List<Character> characters;

  const LocationCharacters(this.characters);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Персонажи',
            style: TextStyle(
              color: ColorPalette.white,
              fontSize: 20,
            ),
          ),
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 24.0),
              itemCount: characters.length > 6 ? 6 : characters.length,
              itemBuilder: (context, index) => CharacterListItem(characters[index]),
            ),
          )
        ],
      ),
    );
  }
}
