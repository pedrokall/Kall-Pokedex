
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TypeWidget extends StatelessWidget {
  const TypeWidget({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(6),
      // margin: EdgeInsets.only(bottom: 8),

      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/svg/types/Type=$name.svg',
              width: 16,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
