import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/models/color_dto.dart';
import 'package:surf_flutter_courses_template/screens/color_details_screen.dart';
import 'package:surf_flutter_courses_template/utils/copy_helper.dart';
import 'package:surf_flutter_courses_template/utils/hex_color.dart';

class ColorCard extends StatelessWidget {
  final ColorDto _colorDto;

  const ColorCard({super.key, required ColorDto colorDto}) : _colorDto = colorDto;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: _colorDto.hex,
          child: Material(
            borderRadius: BorderRadius.circular(16),
            clipBehavior: Clip.antiAlias,
            color: HexColor.fromHex(_colorDto.hex),
            child: InkWell(
              onLongPress: () async {
                await CopyHelper.copyWithSnackbar(context, _colorDto.hex, "Hex скопирован");
              },
              onTap: () {
                Navigator.push<ColorDetailsScreen>(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ColorDetailsScreen(
                            colorDto: _colorDto,
                          )),
                );
              },
              child: const SizedBox(
                height: 100,
                width: 100,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          _colorDto.name,
          style: theme.textTheme.bodySmall,
        ),
        Text(
          _colorDto.hex,
          style: theme.textTheme.bodySmall,
        )
      ],
    );
  }
}
