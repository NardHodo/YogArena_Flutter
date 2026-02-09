import 'package:flutter/material.dart';
import 'package:flutter_projects/main_colors.dart';

class HorizontalDialog extends StatelessWidget {
  final String dialogHeader;
  final String dialogSubheader;
  final String cancelButtonText;
  final String confirmButtonText;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;
  final Color confirmButtonColor;
  final Color cancelButtonColor;
  final Color dialogBackgroundColor;

  const HorizontalDialog({
    Key? key,
    required this.dialogHeader,
    required this.dialogSubheader,
    required this.cancelButtonText,
    required this.confirmButtonText,
    required this.onCancel,
    required this.onConfirm,
    this.confirmButtonColor = Colors.black,
    this.cancelButtonColor = Colors.white,
    this.dialogBackgroundColor = MainColors.switchActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double dialogHeight = screenHeight * 0.40;

    return Material(
      type: MaterialType.transparency,
      child: Container(
        height: dialogHeight,
        width: double.infinity,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: dialogBackgroundColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              dialogHeader,
              style: const TextStyle(
                fontSize: 24,
                fontFamily: 'Merriweather_ExtraBold',
                color: Colors.white,
              ),
            ),
            Text(
              dialogSubheader,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Merriweather_Regular',
                color: Colors.white70,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 120,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: onCancel,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: cancelButtonColor,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      cancelButtonText,
                      style: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'Merriweather_Bold',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                //spacing
                const SizedBox(width: 30.0),

                SizedBox(
                  width: 120,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: onConfirm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: confirmButtonColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      confirmButtonText,
                      style: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'Merriweather_Bold',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
