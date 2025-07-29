import 'package:bookly_app_with_clean_architecture/core/styles.dart';
import 'package:bookly_app_with_clean_architecture/core/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.15,

      child: Row(
        children: [
          ImageWidget(),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  textAlign: TextAlign.left,
                  maxLines: 2,

                  'Conepts of Computer\nScience',
                  style: Styles.font18W600,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Sanjeev Thakur',
                style: Styles.font16W600.copyWith(
                  color: Colors.grey,
                  fontFamily: GoogleFonts.nixieOne().fontFamily,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                color: Colors.blueGrey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Free', style: Styles.font18W600),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow),
                        Text('4.9', style: Styles.font18W600),
                        SizedBox(width: 8),
                        Text(
                          '(2508)',
                          style: Styles.font18W600.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
