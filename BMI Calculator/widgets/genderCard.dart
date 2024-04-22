import 'package:flutter/material.dart';

class GenderSelectionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final Color backgroundColor;
  final VoidCallback onTap;

  const GenderSelectionItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.backgroundColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isSelected ? backgroundColor : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(55.0),
          child: Column(
            children: [
              Icon(
                icon,
                size: 60,
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 20,
                  color: isSelected ? Colors.white : Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}