
import 'package:flutter/material.dart';
import 'package:neuro_shop/core/extensions/localization_extension.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key, required this.title, required this.onTap,
  });
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: textTheme.titleMedium?.copyWith(fontSize: 22)),
        TextButton(onPressed: onTap, child: Text(context.localization.seeAll))
      ],
    );
  }
}