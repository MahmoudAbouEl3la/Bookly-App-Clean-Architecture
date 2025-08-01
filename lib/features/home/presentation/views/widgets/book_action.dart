import 'package:bookly_app_with_clean_architecture/core/widgets/custom_buton.dart';
import 'package:flutter/material.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: width * 0.8,
      child: Row(
        children: [
          Expanded(child: CustomButon(title: '19.99€')),
          const Expanded(
            child: CustomButon(
              title: 'Free Preview',
              backgroundColor: Color(0xFFEF8262),
              textColor: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
