import 'package:flutter/material.dart';
import 'package:ricknmorty/data/dummy.dart';
import 'package:ricknmorty/data/models/character.dart';
import 'package:ricknmorty/theme/color_theme.dart';

class CharacterListItem extends StatelessWidget {
  CharacterListItem(this.character);

  final Character character;

  @override
  Widget build(BuildContext context) {
    Widget CharacterStatus() {
      TextStyle style = TextStyle(color: character.status == 0 ? ColorPalette.green : ColorPalette.red, fontSize: 10);

      switch (character.status) {
        case 0:
          return const Text('ЖИВОЙ', style: TextStyle(color: ColorPalette.green, fontSize: 10));
          break;
        case 1:
          return const Text('МЁРТВЫЙ', style: TextStyle(color: ColorPalette.red, fontSize: 10));
          break;
        case 2:
          return const Text('НЕИЗВЕСТНО', style: TextStyle(color: ColorPalette.blue, fontSize: 10));
          break;
        default:
          return const Text('');
      }
    }

    String CharacterGender() {
      switch (character.gender) {
        case 0:
          return 'Мужской';
          break;
        case 1:
          return 'Женский';
          break;
        case 2:
          return 'Бесполый';
          break;
        default:
          return 'Бесполый';
      }
    }

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/character', arguments: {'id': character.id}),
      behavior: HitTestBehavior.translucent, //fix onTap to empty place in child container
      child: Container(
        margin: EdgeInsets.only(bottom: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: CircleAvatar(
                radius: 37,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(character.imageName),
              ),
            ),
            SizedBox(width: 18),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CharacterStatus(),
                  Text(
                    character.fullName,
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                    softWrap: true,
                    style: TextStyle(
                      color: ColorPalette.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "${character.race}, ${CharacterGender()}",
                    maxLines: 2,
                    style: TextStyle(
                      color: ColorPalette.gray_text,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
