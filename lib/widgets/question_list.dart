import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../res/theme.dart';

class QuestionList extends StatelessWidget {
  const QuestionList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: grey,
          width: 2
        ),
        color: whiteColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Apakah Anda suka minum kopi?',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14
              ),
            ),
          ),
          const SizedBox(width: 16,),
          SvgPicture.asset('assets/svg/right_arrow_oren.svg'),
        ],
      ),
    );

    // return Container(
    //   padding: const EdgeInsets.all(0),
    //   decoration: BoxDecoration(
    //     color: diamondOrange,
    //     // border: Border.all(
    //     //   color: beige
    //     // ),
    //     borderRadius: BorderRadius.circular(5),
    //   ),
    //   child: ListTile(
    //     contentPadding: const EdgeInsets.only(left: 20.0, right: 20.0),
    //     minLeadingWidth: 10,
    //     title: const Text('Apakah Anda suka minum teh di pagi hari?',
    //         style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
    //     trailing: const Icon(Icons.keyboard_arrow_right_rounded,
    //         color: blackColor),
    //   ),
    // );
  }
}