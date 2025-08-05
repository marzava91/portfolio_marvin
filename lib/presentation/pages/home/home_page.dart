import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/pages/home/sections/about_me_section.dart';
import 'package:nimbus/presentation/pages/home/sections/awards_section.dart';
import 'package:nimbus/presentation/pages/home/sections/footer_section/footer_section.dart';
import 'package:nimbus/presentation/pages/home/sections/header_section/header_section.dart';
import 'package:nimbus/presentation/pages/home/sections/nav_section/nav_section_mobile.dart';
import 'package:nimbus/presentation/pages/home/sections/nav_section/nav_section_web.dart';
import 'package:nimbus/presentation/pages/home/sections/projects_section.dart';
import 'package:nimbus/presentation/pages/home/sections/skills_section.dart';
import 'package:nimbus/presentation/widgets/app_drawer.dart';
import 'package:nimbus/presentation/widgets/nav_item.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/utils/functions.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:auto_route/auto_route.dart'; 
import 'package:easy_localization/easy_localization.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool _isLoading = true;

  late final AnimationController _controller;
  late final Animation<double> _animation;

  late final AnimationController _logoController;
  late final Animation<double> _logoAnimation;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final ScrollController _scrollController = ScrollController();

  late final List<NavItemData> navItems;

  @override
  void initState() {
    super.initState();

    navItems = [
      NavItemData(name: 'home'.tr(), key: GlobalKey(), isSelected: true),
      NavItemData(name: 'about'.tr(), key: GlobalKey()),
      NavItemData(name: 'skills'.tr(), key: GlobalKey()),
      NavItemData(name: 'projects'.tr(), key: GlobalKey()),
      NavItemData(name: 'awards'.tr(), key: GlobalKey()),
    ];

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

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

    _scrollController.addListener(() {
      if (_scrollController.position.pixels < 100) {
        _controller.reverse();
      }
    });

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
    _controller.dispose();
    _logoController.dispose();
    _scrollController.dispose();
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

    return _buildMainContent(context);
  }

  Widget _buildMainContent(BuildContext context) {
    double screenHeight = heightOfScreen(context);
    double spacerHeight = screenHeight * 0.10;

    return Scaffold(
      key: _scaffoldKey,
      drawer: ResponsiveBuilder(
        refinedBreakpoints: RefinedBreakpoints(),
        builder: (context, sizingInformation) {
          double screenWidth = sizingInformation.screenSize.width;
          if (screenWidth < RefinedBreakpoints().desktopSmall) {
            return AppDrawer(
              menuList: navItems,
            );
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: ScaleTransition(
        scale: _animation,
        child: FloatingActionButton(
          onPressed: () {
            // Scroll to header section
            scrollToSection(navItems[0].key.currentContext!);
          },
          child: Icon(
            FontAwesomeIcons.arrowUp,
            size: Sizes.ICON_SIZE_18,
            color: AppColors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          ResponsiveBuilder(
            refinedBreakpoints: RefinedBreakpoints(),
            builder: (context, sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width;
              if (screenWidth < RefinedBreakpoints().desktopSmall) {
                return NavSectionMobile(scaffoldKey: _scaffoldKey);
              } else {
                return NavSectionWeb(
                  navItems: navItems,
                );
              }
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Positioned(
                        top: 780, // Mueve verticalmente hacia arriba. Ajusta este valor según lo que necesites
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.asset(ImagePath.BLOB_BEAN_ASH),
                        ),
                      ),
                      Column(
                        children: [
                          HeaderSection(
                            key: navItems[0].key,
                          ),
                          //SizedBox(height: spacerHeight*.3),
                          VisibilityDetector(
                            key: Key("about"),
                            onVisibilityChanged: (visibilityInfo) {
                              double visiblePercentage =
                                  visibilityInfo.visibleFraction * 100;
                              if (visiblePercentage > 10) {
                                _controller.forward();
                              }
                            },
                            child: Container(
                              key: navItems[1].key,
                              child: AboutMeSection(),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: spacerHeight),
                  Stack(
                    children: [
                      Positioned(
                        top: assignWidth(context, 0.2),
                        left: -assignWidth(context, 0.05),
                        child: Image.asset(ImagePath.BLOB_FEMUR_ASH),
                      ),
                      Positioned(
                        right: -assignWidth(context, 0.5),
                        child: Image.asset(ImagePath.BLOB_SMALL_BEAN_ASH),
                      ),
                      Column(
                        children: [
                          Container(
                            key: navItems[2].key,
                            child: SkillsSection(),
                          ),
                          //SizedBox(height: spacerHeight),
                          //StatisticsSection(),
                          SizedBox(height: spacerHeight),
                          Container(
                            key: navItems[3].key,
                            child: ProjectsSection(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: spacerHeight),
                  Stack(
                    children: [
                      Positioned(
                        left: -assignWidth(context, 0.6),
                        child: Image.asset(ImagePath.BLOB_ASH),
                      ),
                      Column(
                        children: [
                          Container(
                            key: navItems[4].key,
                            child: AwardsSection(),
                          ),
                          SpaceH40(),
                          //Container(
                          //  key: navItems[5].key,
                          //  child: BlogSection(),
                          //),
                          FooterSection(),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
