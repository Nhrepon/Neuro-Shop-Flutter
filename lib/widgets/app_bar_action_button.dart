
import 'package:flutter/material.dart';

class appBarActionButton extends StatelessWidget {
  const appBarActionButton({
    super.key, required this.icon, required this.onTap,

  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 18,
        backgroundColor: Colors.grey.withValues(alpha: 0.3),
        child: Icon(icon, color: Colors.black54,),
      ),
    );
  }
}