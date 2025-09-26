import 'package:bookly_app_with_clean_architecture/core/styles.dart';
import 'package:bookly_app_with_clean_architecture/core/widgets/custom_buton.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.bookEntity});
  final BookEntity bookEntity;

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
                  bookEntity.price != null && bookEntity.price != 0
                      ? "${bookEntity.price}€"
                      : "Free",
            ),
          ),
          Expanded(
            child: CustomButon(
              title: checkPreview(bookEntity.previewLink ?? ""),
              backgroundColor: Color(0xFFEF8262),
              textColor: Color.fromARGB(255, 65, 55, 55),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              onPressed: () async {
                await _launchUrl(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    final link = bookEntity.previewLink ?? "";

    if (link.isEmpty) {
      messenger.showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "No preview link available",
            style: Styles.font16W500.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      );
      return;
    }

    Uri uri = Uri.parse(link);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      messenger.showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "Cannot open the link",
            style: Styles.font16W500.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      );
    }
  }

  String checkPreview(String text) {
    if (bookEntity.previewLink == null || bookEntity.previewLink == "") {
      return "Not Available";
    } else {
      return "Preview";
    }
  }
}
