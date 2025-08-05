import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../base/project_base_screen.dart';
import 'package:nimbus/values/values.dart';
import 'package:url_launcher/url_launcher.dart';

class MijiMobileAppScreen extends StatelessWidget {
  const MijiMobileAppScreen({super.key});

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
                  Icons.shopping_cart_outlined,
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
                  'miji_mobile_title'.tr(),
                  style: theme.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'miji_mobile_intro'.tr(),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: isDark ? AppColors.grey350 : AppColors.secondaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Text(
                  'miji_mobile_stack_title'.tr(),
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
                  children: 'miji_mobile_stack_items'.tr().split(',').map((tech) {
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
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: () async {
                    final uri = Uri.parse('https://www.mijimarkets.com/#/descargar');
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri, mode: LaunchMode.externalApplication);
                    }
                  },
                  icon: const Icon(Icons.open_in_new),
                  label: Text('visit_website'.tr()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'miji_mobile_download_note'.tr(),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: isDark ? AppColors.grey350 : AppColors.secondaryColor,
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
