part of values;

class Data {
  static List<SocialButtonData> socialData = [
    SocialButtonData(
      tag: StringConst.WHATSAPP_URL,
      iconData: FontAwesomeIcons.whatsapp,
      url: StringConst.WHATSAPP_URL,
    ),
    SocialButtonData(
      tag: StringConst.GITHUB_URL,
      iconData: FontAwesomeIcons.github,
      url: StringConst.GITHUB_URL,
    ),
    SocialButtonData(
      tag: StringConst.LINKED_IN_URL,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
    SocialButtonData(
      tag: StringConst.INSTAGRAM_URL,
      iconData: FontAwesomeIcons.instagram,
      url: StringConst.INSTAGRAM_URL,
    ),
  ];
  //static List<SocialButton2Data> socialData2 = [
  //  SocialButton2Data(
  //    title: StringConst.DRIBBLE,
  //    iconData: FontAwesomeIcons.dribbble,
  //    url: StringConst.DRIBBLE_URL,
  //    titleColor: AppColors.pink300,
  //    buttonColor: AppColors.pink300,
  //    iconColor: AppColors.white,
  //  ),
  //  SocialButton2Data(
  //    title: StringConst.INSTA,
  //    iconData: FontAwesomeIcons.instagram,
  //    url: StringConst.INSTAGRAM_URL,
  //    titleColor: AppColors.yellow300,
  //    buttonColor: AppColors.yellow300,
  //    iconColor: AppColors.white,
  //  ),
  //];

  static List<SkillLevelData> skillLevelData = [
    SkillLevelData(
      skill: StringConst.TOOLS_1_NAME,
      level: 90,
    ),
    SkillLevelData(
      skill: StringConst.TOOLS_2_NAME,
      level: 85,
    ),
    SkillLevelData(
      skill: StringConst.TOOLS_3_NAME,
      level: 75,
    ),
    SkillLevelData(
      skill: StringConst.TOOLS_4_NAME,
      level: 80,
    ),
    SkillLevelData(
      skill: StringConst.TOOLS_5_NAME,
      level: 70,
    ),
    SkillLevelData(
      skill: StringConst.TOOLS_6_NAME,
      level: 70,
    ),
  ];

  static List<SkillCardData> skillCardData = [
    SkillCardData(
      title: 'skills_1'.tr(), 
      description: 'skills_1_desc'.tr(), 
      iconData: FontAwesomeIcons.flutter,
    ),
    SkillCardData(
        title: "",
        description: "",
        iconData: Icons.pages_outlined), //not being used
    SkillCardData(
      title: 'skills_2'.tr(),
      description: 'skills_2_desc'.tr(),
      iconData: FontAwesomeIcons.fire,
    ),
    SkillCardData(
      title: 'skills_3'.tr(),
      description: 'skills_3_desc'.tr(),
      iconData: FontAwesomeIcons.python,
    ),
    SkillCardData(
      title: 'skills_4'.tr(),
      description: 'skills_4_desc'.tr(),
      iconData: FontAwesomeIcons.database,
    ),
    SkillCardData(
        title: "",
        description: "",
        iconData: Icons.pages_outlined), //not being used
  ];
  static List<StatItemData> statItemsData = [
    StatItemData(value: 120, subtitle: StringConst.HAPPY_CLIENTS),
    StatItemData(value: 10, subtitle: StringConst.YEARS_OF_EXPERIENCE),
    StatItemData(value: 230, subtitle: StringConst.INCREDIBLE_PROJECTS),
    StatItemData(value: 18, subtitle: StringConst.AWARD_WINNING),
  ];

  static List<ProjectCategoryData> projectCategories = [
    ProjectCategoryData(title: 'all'.tr(), number: 5, isSelected: true),
    ProjectCategoryData(title: 'web_development'.tr(), number: 3),
    ProjectCategoryData(title: 'mobile_development'.tr(), number: 1),
    ProjectCategoryData(title: 'data_analytics'.tr(), number: 1),
    ProjectCategoryData(title: 'data_science'.tr(), number: 0),
  ];

  static List<String> awards1 = [
    'awards_1'.tr(),
    'awards_2'.tr(),
    'awards_3'.tr(),
    'awards_4'.tr(),
  ];
  static List<String> awards2 = [
    StringConst.AWARDS_6,
    StringConst.AWARDS_7,
    StringConst.AWARDS_8,
    StringConst.AWARDS_9,
    StringConst.AWARDS_10,
  ];
  static List<BlogCardData> blogData = [
    BlogCardData(
      category: StringConst.BLOG_CATEGORY_1,
      title: StringConst.BLOG_TITLE_1,
      date: StringConst.BLOG_DATE,
      buttonText: StringConst.READ_MORE,
      imageUrl: ImagePath.BLOG_01,
    ),
    BlogCardData(
      category: StringConst.BLOG_CATEGORY_2,
      title: StringConst.BLOG_TITLE_2,
      date: StringConst.BLOG_DATE,
      buttonText: StringConst.READ_MORE,
      imageUrl: ImagePath.BLOG_02,
    ),
    BlogCardData(
      category: StringConst.BLOG_CATEGORY_3,
      title: StringConst.BLOG_TITLE_3,
      date: StringConst.BLOG_DATE,
      buttonText: StringConst.READ_MORE,
      imageUrl: ImagePath.BLOG_03,
    ),
  ];

  static List<NimBusCardData> nimbusCardData = [
    NimBusCardData(
      title: 'app_dev',
      subtitle: 'app_dev_desc',
      leadingIcon: Icons.done,
      trailingIcon: Icons.chevron_right,
    ),
    NimBusCardData(
      title: 'data_sci',
      subtitle: 'data_sci_desc',
      leadingIcon: Icons.done,
      trailingIcon: Icons.chevron_right,
      circleBgColor: AppColors.primaryColor
    ),
    NimBusCardData(
      title: 'mvp_builder',
      subtitle: 'mvp_builder_desc',
      leadingIcon: Icons.done,
      trailingIcon: Icons.chevron_right,
      leadingIconColor: AppColors.black,
      circleBgColor: AppColors.grey50,
    ),
  ];

  static List<ProjectData> allProjects = [
    ProjectData(
      title: 'portfolio_1_title'.tr(),
      category: 'web_development'.tr(),
      projectCoverUrl: ImagePath.PORTFOLIO_1,
      route: '/projects/miji-admin-panel',
      width: 0.5,
      mobileHeight: 0.3,
    ),
    ProjectData(
      title: 'portfolio_2_title'.tr(),
      category: 'mobile_development'.tr(),
      projectCoverUrl: ImagePath.PORTFOLIO_2,
      route: '/projects/miji-mobile-app',
      width: 0.225,
    ),
    ProjectData(
      title: 'portfolio_3_title'.tr(),
      category: 'web_development'.tr(),
      projectCoverUrl: ImagePath.PORTFOLIO_3,
      route: '/projects/miji-landing-page',
      width: 0.225,
    ),
    ProjectData(
      title: 'portfolio_4_title'.tr(),
      category: 'data_analytics'.tr(),
      projectCoverUrl: ImagePath.PORTFOLIO_4,
      route: '/projects/miji-analytics',
      width: 0.2375,
    ),
    ProjectData(
      title: 'portfolio_5_title'.tr(),
      category: 'web_development'.tr(),
      projectCoverUrl: ImagePath.PORTFOLIO_5,
      route: '/projects/tec-landing-page',
      width: 0.2375,
    ),
  ];


  static List<ProjectData> webDeveloper = [
    ProjectData(
      title: 'portfolio_1_title'.tr(),
      category: 'web_development'.tr(),
      projectCoverUrl: ImagePath.PORTFOLIO_1,
      route: '/projects/miji-admin-panel',
      width: 0.5,
    ),
    ProjectData(
      title: 'portfolio_3_title'.tr(),
      category: 'web_development'.tr(),
      projectCoverUrl: ImagePath.PORTFOLIO_3,
      route: '/projects/miji-landing-page',
      width: 0.225,
    ),
    ProjectData(
      title: 'portfolio_5_title'.tr(),
      category: 'web_development'.tr(),
      projectCoverUrl: ImagePath.PORTFOLIO_5,
      route: '/projects/tec-landing-page',      
      width: 0.225,
    )
  ];
  static List<ProjectData> appDeveloper= [
    ProjectData(
      title: 'portfolio_2_title'.tr(),
      category: 'mobile_development'.tr(),
      projectCoverUrl: ImagePath.PORTFOLIO_2,
      route: '/projects/miji-mobile-app',
      width: 0.2375,
    ),
  ];
  static List<ProjectData> dataAnalytics = [
    ProjectData(
      title: 'portfolio_4_title'.tr(),
      category: 'data_analytics'.tr(),
      projectCoverUrl: ImagePath.PORTFOLIO_4,
      route: '/projects/miji-analytics',
      width: 0.2375,
    )
  ];
  static List<ProjectData> dataScience = [
  ];
}
