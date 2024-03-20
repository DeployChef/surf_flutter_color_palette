import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/Models/color_dto.dart';
import 'package:surf_flutter_courses_template/Utils/hex_color.dart';

class ColorDetailsScreen extends StatelessWidget {
  final ColorDto _colorDto;

  const ColorDetailsScreen({super.key, required ColorDto colorDto}) : _colorDto = colorDto;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
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
      body: Column(children: [
        Hero(
          tag: _colorDto.hex,
          child: Container(
            height: height / 2,
            width: double.infinity,
            color: HexColor.fromHex(_colorDto.hex),
          ),
        ),
      ]),
    );
  }
}
