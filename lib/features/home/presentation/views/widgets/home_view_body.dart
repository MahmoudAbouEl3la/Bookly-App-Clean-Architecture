import 'package:bookly_app_with_clean_architecture/constans.dart';
import 'package:bookly_app_with_clean_architecture/core/extensions/context_extension.dart';
import 'package:bookly_app_with_clean_architecture/core/styles.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/featured_books/featured_books_list_view_bloc_builder.dart';
import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/newest_books/newest_books_list_view_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly_app_with_clean_architecture/features/home/domain/manager/newest_book_cubit/newest_book_cubit.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late final ScrollController _scrollController;
  var _nextPage = 1;
  bool _isLoadingMore = false;
  static const double _triggerPercent = 70.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() async {
    if (!_scrollController.hasClients) return;
    final max = _scrollController.position.maxScrollExtent;
    if (max <= 0) return;
    final current = _scrollController.position.pixels;
    final distance = (current / max) * 100;

    if (distance >= _triggerPercent && !_isLoadingMore) {
      _isLoadingMore = true;
      // نادِ الكيوبت لطلب الصفحة التالية
      await context.read<NewestBookCubit>().fetchNewestBooks(page: _nextPage++);
      _isLoadingMore = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final isDark = context.isDarkMode;

    return CustomScrollView(
      controller: _scrollController, // 👈 كنترولر موحّد لكامل السك롤
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomAppBar(),
              ),
              const FeaturedBooksListViewBlocBuilder(),
              SizedBox(height: height * 0.055),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Text(
                  'Newest Books',
                  style: Styles.font18W600.copyWith(
                    color: isDark ? kSecondaryColor : kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),

        // لاحظ: نضمن أن NewestBooksListViewBlocBuilder ترجع Sliver مباشرة
        const NewestBooksListViewBlocBuilder(),
      ],
    );
  }
}
