import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/components/details_button.dart';
import 'package:surf_flutter_courses_template/models/color_dto.dart';
import 'package:surf_flutter_courses_template/utils/copy_helper.dart';
import 'package:surf_flutter_courses_template/utils/hex_color.dart';

class ColorDetailsScreen extends StatelessWidget {
  final ColorDto _colorDto;

  const ColorDetailsScreen({super.key, required ColorDto colorDto}) : _colorDto = colorDto;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var color = HexColor.fromHex(_colorDto.hex);
    final theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Hero(
            tag: _colorDto.hex,
            child: Container(
              height: height / 2,
              width: double.infinity,
              color: color,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _colorDto.name,
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 16,
                ),
                DetailsButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Hex"),
                      Text(_colorDto.hex),
                    ],
                  ),
                  onPressed: () async {
                    await CopyHelper.copyWithSnackbar(context, _colorDto.hex, "Hex скопирован");
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DetailsButton(
                      child: Text("Red ${color.red}"),
                      onPressed: () async {
                        await CopyHelper.copyWithSnackbar(context, color.red.toString(), "Red скопирован");
                      },
                    ),
                    DetailsButton(
                      child: Text("Green ${color.green}"),
                      onPressed: () async {
                        await CopyHelper.copyWithSnackbar(context, color.green.toString(), "Green скопирован");
                      },
                    ),
                    DetailsButton(
                      child: Text("Blue ${color.blue}"),
                      onPressed: () async {
                        await CopyHelper.copyWithSnackbar(context, color.blue.toString(), "Blue скопирован");
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
