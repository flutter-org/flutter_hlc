import 'package:flutter/material.dart';

class SXTag extends StatelessWidget {
  final String tagText;
  final Color? color;

  const SXTag({
    Key? key,
    required this.tagText,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: (color ?? Colors.blue).withOpacity(0.2),
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Text(
        tagText,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: color ?? Colors.blue,
        ),
      ),
    );
  }
}
