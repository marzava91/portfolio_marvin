import 'package:flutter/material.dart';
import 'package:nimbus/presentation/pages/home/sections/footer_section/footer_section.dart';
import 'package:nimbus/presentation/pages/home/sections/nav_section/nav_section_mobile.dart';
import 'package:nimbus/presentation/pages/home/sections/nav_section/nav_section_web.dart';
import 'package:nimbus/presentation/widgets/app_drawer.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProjectBaseScreen extends StatefulWidget {
  final Widget content;

  ProjectBaseScreen({required this.content});

  @override
  State<ProjectBaseScreen> createState() => _ProjectBaseScreenState();
}

class _ProjectBaseScreenState extends State<ProjectBaseScreen>
    with TickerProviderStateMixin {
  bool _isLoading = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  late final AnimationController _logoController;
  late final Animation<double> _logoAnimation;

  @override
  void initState() {
    super.initState();

    _logoController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    _logoAnimation = Tween<double>(begin: 0.85, end: 1.15).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: Curves.easeInOutSine,
      ),
    );

    _simulateInitialLoad();
  }

  Future<void> _simulateInitialLoad() async {
    await Future.delayed(const Duration(milliseconds: 1600));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    super.dispose();
  }

  String getLogoForTheme(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? 'assets/images/icon_dark.png'
        : 'assets/images/icon_light.png';
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Center(
          child: ScaleTransition(
            scale: _logoAnimation,
            child: Image.asset(
              getLogoForTheme(context),
              width: 120,
              height: 120,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      key: _scaffoldKey,
      drawer: ResponsiveBuilder(
        refinedBreakpoints: RefinedBreakpoints(),
        builder: (context, sizingInformation) {
          if (sizingInformation.screenSize.width < RefinedBreakpoints().desktopSmall) {
            return AppDrawer(menuList: []);
          } else {
            return SizedBox.shrink();
          }
        },
      ),
      body: Column(
        children: [
          ResponsiveBuilder(
            refinedBreakpoints: RefinedBreakpoints(),
            builder: (context, sizingInformation) {
              if (sizingInformation.screenSize.width < RefinedBreakpoints().desktopSmall) {
                return NavSectionMobile(scaffoldKey: _scaffoldKey);
              } else {
                return NavSectionWeb(navItems: []);
              }
            },
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: 200,
                  left: -200,
                  child: Image.asset(ImagePath.BLOB_BEAN_ASH, width: 300),
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.content,
                      FooterSection(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
