import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../base/project_base_screen.dart';
import 'package:nimbus/values/values.dart';
import 'package:url_launcher/url_launcher.dart';

class MijiAdminPanelScreen extends StatelessWidget {
  const MijiAdminPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                  Icons.admin_panel_settings_rounded,
                  size: 80,
                  color: AppColors.primaryColor,
                ),
                const SizedBox(height: 24),
                Text(
                  'under_construction'.tr(),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.primaryText2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Text(
                  'miji_admin_title'.tr(),
                  style: theme.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'miji_admin_intro'.tr(),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Text(
                  'miji_admin_stack_title'.tr(),
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12,
                  runSpacing: 12,
                  children: 'miji_admin_stack_items'.tr().split(',').map((tech) {
                    return Chip(
                      label: Text(tech.trim()),
                      backgroundColor: AppColors.primaryColor.withOpacity(0.1),
                      labelStyle: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 32),
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  onPressed: () async {
                    final uri = Uri.parse('https://admin.mijimarkets.com');
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri, mode: LaunchMode.externalApplication);
                    }
                  },
                  icon: const Icon(Icons.open_in_new_rounded),
                  label: Text('visit_website'.tr()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
