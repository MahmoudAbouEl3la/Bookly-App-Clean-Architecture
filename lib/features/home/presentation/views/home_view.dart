import 'package:bookly_app_with_clean_architecture/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) return;

          final shouldExit = await showDialog<bool>(
            context: context,
            builder:
                (dialogContext) => AlertDialog(
                  title: const Text("Exit App"),
                  content: const Text("Are you sure you want to exit?"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(dialogContext).pop(false),
                      child: const Text(
                        "No",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(dialogContext).pop(true),
                      child: const Text(
                        "Yes",
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    ),
                  ],
                ),
          );

          if (shouldExit ?? false) {
            SystemNavigator.pop();
          }
        },
        child: const HomeViewBody(),
      ),
    );
  }
}
