import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surf_flutter_courses_template/Models/color_dto.dart';
import 'package:surf_flutter_courses_template/Screens/color_details_screen.dart';
import 'package:surf_flutter_courses_template/Utils/hex_color.dart';

class ColorCard extends StatelessWidget {
  ColorDto _colorDto;

  ColorCard({super.key, required ColorDto colorDto}) : _colorDto = colorDto;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: _colorDto.hex,
            child: Material(
              borderRadius: BorderRadius.circular(16),
              clipBehavior: Clip.antiAlias,
              color: HexColor.fromHex(_colorDto.hex),
              child: InkWell(
                onTap: () {
                  Navigator.push<ColorDetailsScreen>(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ColorDetailsScreen(
                              colorDto: _colorDto,
                            )),
                  );
                },
                child: SizedBox(
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            _colorDto.name,
            style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: const Color(0xFF252838),
            ),
          ),
          Text(
            _colorDto.hex,
            style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: const Color(0xFF252838),
            ),
          )
        ],
      ),
    );
  }
}
