import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surf_flutter_courses_template/Components/color_card.dart';
import 'package:surf_flutter_courses_template/DataAccess/i_color_repository.dart';
import 'package:surf_flutter_courses_template/Models/color_dto.dart';
import 'package:surf_flutter_courses_template/Utils/hex_color.dart';

class PaletteScreen extends StatelessWidget {
  IColorRepository _repository;

  PaletteScreen({Key? key, required IColorRepository repository}) : _repository = repository;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 115,
        title: Padding(
          padding: const EdgeInsets.only(top: 44),
          child: Text(
            "Эксклюзивная палитра\n«Colored Box»",
            style: theme.textTheme.bodyLarge,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 32,
          horizontal: 16,
        ),
        child: FutureBuilder(
          future: _repository.getColors(),
          builder: (context, AsyncSnapshot<List<ColorDto>> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return Text("Нет ни одного цвета");
              }
              return ColorsGrid(
                colors: snapshot.data!,
              );
            } else if (snapshot.hasError) {
              return Text("Ошибка загрузки данных");
            } else {
              return Center(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class ColorsGrid extends StatelessWidget {
  List<ColorDto> _colors;

  ColorsGrid({super.key, required List<ColorDto> colors}) : _colors = colors;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 22,
      mainAxisSpacing: 40,
      childAspectRatio: 100 / 140,
      children: [..._colors.map((e) => ColorCard(colorDto: e))],
    );
  }
}
