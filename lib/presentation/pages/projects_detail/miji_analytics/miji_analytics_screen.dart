import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../base/project_base_screen.dart';
import 'package:nimbus/values/values.dart';

class MijiAnalyticsScreen extends StatelessWidget {
  const MijiAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return ProjectBaseScreen(
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 120),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.analytics_outlined,
                  size: 80,
                  color: AppColors.primaryColor,
                ),
                const SizedBox(height: 24),
                Text(
                  'under_construction'.tr(),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: isDark ? AppColors.primaryText1 : AppColors.primaryText2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Text(
                  'miji_analytics_title'.tr(),
                  style: theme.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'miji_analytics_intro'.tr(),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: isDark ? AppColors.grey350 : AppColors.secondaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Text(
                  'miji_analytics_stack_title'.tr(),
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12,
                  runSpacing: 12,
                  children: 'miji_analytics_stack_items'.tr().split(',').map((tech) {
                    return Chip(
                      label: Text(tech.trim()),
                      backgroundColor: AppColors.primaryColor.withOpacity(0.2),
                      labelStyle: TextStyle(
                        color: isDark ? AppColors.grey350 : AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
