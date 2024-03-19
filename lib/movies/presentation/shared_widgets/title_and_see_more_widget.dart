import 'package:flutter/material.dart';

class TitleAndSeeMoreWidget extends StatelessWidget {
  final String title ;
   final Function()? onTap;
  const TitleAndSeeMoreWidget({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16,end:16,top: 20,bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey[300],
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          InkWell(
            onTap: onTap,
            child: const Row(
              children: [
                Text(
                  'See More',
                ),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 14,
                )
              ],
            ),
          )
        ],
      ),
    )
    ;
  }
}
