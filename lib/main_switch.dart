import 'package:flutter/material.dart';
import 'main_colors.dart';

class MainSwitch extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;

  const MainSwitch({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.activeColor = MainColors.switchActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontFamily: 'Merriweather_Bold',
        ),
      ),
      value: value,
      activeColor: activeColor,
      activeTrackColor: activeColor.withOpacity(0.5),
      inactiveThumbColor: Colors.black,
      inactiveTrackColor: Colors.white.withOpacity(0.5),
      onChanged: onChanged,
    );
  }
}
