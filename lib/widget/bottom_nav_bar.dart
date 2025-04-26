import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Important! So it wraps content height
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                'assets/icons/home_outline.png',
                'assets/icons/home_filled.png',
                0,
              ),
              _buildNavItem(
                'assets/icons/checklist_outline.png',
                'assets/icons/checklist_filled.png',
                1,
              ),
              _buildCenterButton(),
              _buildNavItem(
                'assets/icons/notification_outline.png',
                'assets/icons/notification_filled.png',
                3,
              ),
              _buildNavItem(
                'assets/icons/message_outline.png',
                'assets/icons/message_filled.png',
                4,
              ),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildNavItem(String outlinePath, String filledPath, int index) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        onTabSelected(index);
      },
      behavior: HitTestBehavior.translucent, // still important
      child: Container(
        width: 45, // Tap area
        height: 45,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: isSelected ? 0.0 : 1.0,
              child: Image.asset(
                outlinePath,
                width: 28,
                height: 28,
                fit: BoxFit.contain, // Important to not stretch
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: isSelected ? 1.0 : 0.0,
              child: Image.asset(
                filledPath,
                width: 28,
                height: 28,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterButton() {
    return GestureDetector(
      onTap: () => onTabSelected(2),
      child: Container(
        width: 45,
        height: 45,
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Icon(Icons.add, color: Colors.white, size: 30),
        ),
      ),
    );
  }
}
