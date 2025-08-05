import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';

class NavSectionMobile extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const NavSectionMobile({required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.HEIGHT_100,
      decoration: BoxDecoration(
        color: AppColors.black100,
      ),
      child: Row(
        children: [
          SpaceW30(),
          IconButton(
            icon: Icon(
              FeatherIcons.menu,
              color: AppColors.white,
              size: Sizes.ICON_SIZE_26,
            ),
            onPressed: () {
              if (scaffoldKey.currentState!.isEndDrawerOpen) {
                scaffoldKey.currentState?.openEndDrawer();
              } else {
                scaffoldKey.currentState?.openDrawer();
              }
            },
          ),
          Spacer(),
          InkWell(
            onTap: () => GoRouter.of(context).go('/'),
            child: Image.asset(
              ImagePath.LOGO_LIGHT,
              height: Sizes.HEIGHT_52,
            ),
          ),
          Spacer(),
          IconButton(
            icon: Text(
              context.locale.languageCode == 'es' ? '🇪🇸' : '🇬🇧',
              style: const TextStyle(fontSize: 20),
            ),
            tooltip: context.locale.languageCode == 'es'
                ? 'Cambiar idioma'
                : 'Change Language',
            onPressed: () {
              final current = context.locale;
              if (current.languageCode == 'es') {
                context.setLocale(const Locale('en'));
              } else {
                context.setLocale(const Locale('es'));
              }
            },
          ),
          SpaceW30(),
        ],
      ),
    );
  }
}
