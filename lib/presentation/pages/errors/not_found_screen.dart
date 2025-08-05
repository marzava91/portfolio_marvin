import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nimbus/values/values.dart';
import 'package:nimbus/presentation/pages/projects_detail/base/project_base_screen.dart';
import 'package:easy_localization/easy_localization.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ProjectBaseScreen(
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 150),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              children: [
                Icon(
                  Icons.error_outline,
                  color: AppColors.primaryColor,
                  size: 80,
                ),
                const SizedBox(height: 24),
                Text(
                  'not_found_title'.tr(),
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  'not_found_description'.tr(),
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: AppColors.grey250,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  onPressed: () => context.go('/'),
                  icon: const Icon(Icons.home),
                  label: Text('go_home'.tr()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
