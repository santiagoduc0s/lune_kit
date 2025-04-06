import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// A custom bottom navigation bar widget.
class CustomBottomNavigationBarItem {
  /// Creates a [CustomBottomNavigationBarItem].
  const CustomBottomNavigationBarItem({
    required this.icon,
    required this.label,
  });

  /// The icon to display in the navigation bar item.
  final Widget icon;

  /// The label to display below the icon.
  final String label;
}

/// A custom bottom navigation bar widget.
class CustomBottomNavigationBar extends StatelessWidget {
  /// Creates a [CustomBottomNavigationBar].
  const CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTabSelected,
    required this.items,
    super.key,
  });

  /// Currently selected index of the navigation bar.
  final int currentIndex;

  /// Callback function to handle tab selection.
  final ValueChanged<int> onTabSelected;

  /// List of items to display in the navigation bar.
  final List<CustomBottomNavigationBarItem> items;

  @override
  Widget build(BuildContext context) {
    final paddingBottom = MediaQuery.of(context).padding.bottom;
    final colors = Theme.of(context).colorScheme;

    return Container(
      color: colors.surface,
      padding: EdgeInsets.only(
        top: 3.space,
        bottom: 3.space + paddingBottom,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          items.length,
          (index) => _NavItem(
            index: index,
            item: items[index],
            isSelected: currentIndex == index,
            onTap: onTabSelected,
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  /// Creates a [_NavItem].
  const _NavItem({
    required this.index,
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  final int index;
  final CustomBottomNavigationBarItem item;
  final bool isSelected;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final color = isSelected ? colors.primary : colors.onSurface;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconTheme(
            data: IconThemeData(color: color),
            child: item.icon,
          ),
          SizedBox(height: 1.space),
          Text(
            item.label,
            style: TextStyle(color: color),
          ),
        ],
      ),
    );
  }
}
