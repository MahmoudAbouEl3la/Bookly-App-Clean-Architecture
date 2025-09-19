import 'package:bookly_app_with_clean_architecture/core/widgets/custom_buton.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.bookPrice});
  final BookEntity bookPrice;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: width * 0.8,
      child: Row(
        children: [
          Expanded(
            child: CustomButon(
              title:
                  bookPrice.price != null && bookPrice.price != 0
                      ? "${bookPrice.price}€"
                      : "Free",
            ),
          ),
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
