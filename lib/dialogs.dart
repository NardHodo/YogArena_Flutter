import 'package:flutter/material.dart';
import 'package:flutter_projects/main_colors.dart';

//static dialog start
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
//static dialog end

//carousel dialog start
class CarouselDialog extends StatefulWidget {
  // final VoidCallback onCancel;
  // final VoidCallback onPrevious;
  // final VoidCallback onNext;

  @override
  State<CarouselDialog> createState() => _CarouselDialogState();
}

class _CarouselDialogState extends State<CarouselDialog> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  final int _totalPages = 2;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double dialogHeight = screenHeight * 0.90;
    final bool isLastPage = currentIndex == _totalPages - 1;
    final bool isFirstPage = currentIndex == 0;

    return Material(
      type: MaterialType.transparency,
      color: Colors.black,
      child: SizedBox(
        height: dialogHeight,
        width: double.infinity,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: _buildDialogContent(
            isFirstPage ? "First Page Title" : "Second Page Title",
            isFirstPage
                ? "This is the first page subtitle."
                : "This is the second page subtitle.",
            currentIndex,
          ),
        ),
      ),
    );
  }

  Widget _buildDialogContent(String title, String subtitle, int index) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dialogHeight = screenHeight * 0.90;

    bool isLastPage = index == _totalPages - 1;
    bool isFirstPage = index == 0;

    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(10.0), // Increased padding for better look
      decoration: BoxDecoration(color: MainColors.switchActive),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontFamily: 'Merriweather_ExtraBold',
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  height: dialogHeight * 0.45, // Adjusted to prevent overflow
                  width: screenWidth * 0.70,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Center(
                    child: Text(
                      "Image/Content Placeholder",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  subtitle,
                  textAlign: TextAlign.center, // Center text alignment
                  style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'Merriweather_Regular',
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 20),
                !isFirstPage
                    ? ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text(
                          "Close",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Merriweather_Bold',
                          ),
                        ),
                      )
                    : SizedBox(height: 50),
              ],
            ),
          ),
          if (!isLastPage)
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Center(
                child: SizedBox(
                  height: 75,
                  width: 75,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (currentIndex < _totalPages - 1) {
                          currentIndex++;
                        }
                      });
                    },
                    icon: Image.asset('assets/images/next_white.png'),
                    style: IconButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          if (!isFirstPage)
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Center(
                child: SizedBox(
                  height: 75,
                  width: 75,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (currentIndex > 0) {
                          currentIndex--;
                        }
                      });
                    },
                    icon: Image.asset('assets/images/prev_white.png'),
                    style: IconButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
