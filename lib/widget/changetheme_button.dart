import 'package:filter_old/bloc/theme/theme_bloc.dart';
import 'package:filter_old/bloc/theme/theme_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({Key? key}) : super(key: key);

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  bool isDark = true;

  @override
  Widget build(BuildContext context) {
    final themeBloc = BlocProvider.of<ThemeBloc>(context);
    List<bool> _selections = List.generate(3, (_) => false);
    return ToggleButtons(
      children: const <Widget>[
        Icon(Icons.light_mode),
        Icon(Icons.dark_mode),
        Icon(Icons.mobile_friendly),
      ],
      isSelected: _selections,
      onPressed: (int index) {
        ThemeMode theme = index == 1 ? ThemeMode.dark : ThemeMode.light;
        themeBloc.add(ThemeToggle(theme));

        setState(() {
          _selections[index] = !_selections[index];
        });
      },
    );
  }
}
