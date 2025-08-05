import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/blog_card.dart';
import 'package:nimbus/presentation/widgets/buttons/nimbus_button.dart';
import 'package:nimbus/presentation/widgets/content_area.dart';
import 'package:nimbus/presentation/widgets/nimbus_info_section.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

const double kSpacing = 28.0;
const double kRunSpacing = 16.0;

class BlogSection extends StatelessWidget {
  BlogSection({Key? key}) : super(key: key);

  final int blogLength = Data.blogData.length;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    EdgeInsetsGeometry padding =
        EdgeInsets.symmetric(horizontal: getSidePadding(context));
    double headerIntroTextSize = responsiveSize(
      context,
      Sizes.TEXT_SIZE_36,
      Sizes.TEXT_SIZE_56,
      md: Sizes.TEXT_SIZE_36,
    );
    double screenWidth =
        widthOfScreen(context) - (getSidePadding(context) * 2);
    double contentAreaWidth =
        responsiveSize(context, screenWidth, screenWidth * 0.6);

    return Stack(
      children: [
        Positioned(
          top: 60,
          right: 0,
          child: SelectableText(
            StringConst.BLOGGING,
            style: textTheme.displayLarge?.copyWith(
              color: AppColors.grey50,
              fontSize: headerIntroTextSize * 2,
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ResponsiveBuilder(builder: (context, sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width;
              if (screenWidth <= (RefinedBreakpoints().tabletSmall)) {
                return ContentArea(
                  padding: padding,
                  child: Column(
                    children: [
                      ContentArea(
                        width: contentAreaWidth,
                        child: NimbusInfoSection2(
                          sectionTitle: (context) => StringConst.MY_BLOG,
                          title1: (context) => StringConst.BLOG_SECTION_TITLE_1,
                          title2: (context) => StringConst.BLOG_SECTION_TITLE_2,
                          body: (context) => StringConst.BLOG_DESC,
                        ),
                      ),
                      SpaceH50(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: NimbusButton(
                          buttonTitle: StringConst.BLOG_VIEW_ALL,
                          buttonColor: AppColors.primaryColor,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return ContentArea(
                  padding: padding,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ContentArea(
                        width: screenWidth * 0.7,
                        child: NimbusInfoSection1(
                          sectionTitle: (context) => StringConst.MY_BLOG,
                          title1: (context) => StringConst.BLOG_SECTION_TITLE_1,
                          title2: (context) => StringConst.BLOG_SECTION_TITLE_2,
                          body: (context) => StringConst.BLOG_DESC,
                        ),
                      ),
                      Spacer(),
                      NimbusButton(
                        buttonTitle: StringConst.BLOG_VIEW_ALL,
                        buttonColor: AppColors.primaryColor,
                        onPressed: () {},
                      ),
                    ],
                  ),
                );
              }
            }),
            SpaceH40(),
            Padding(
              padding: padding,
              child: Wrap(
                spacing: kSpacing,
                runSpacing: kRunSpacing,
                children: _buildBlogCards(
                  blogData: Data.blogData,
                  width: screenWidth,
                ),
              ),
            ),
            SpaceH100(),
          ],
        ),
      ],
    );
  }

  List<Widget> _buildBlogCards({
    required List<BlogCardData> blogData,
    required double width,
  }) {
    double cardWidth = ((width - (kSpacing * 2)) / 3);
    return blogData.map((blog) {
      return BlogCard(
        width: cardWidth,
        imageWidth: cardWidth,
        imageHeight: cardWidth,
        category: blog.category,
        title: blog.title,
        date: blog.date,
        buttonText: blog.buttonText,
        imageUrl: blog.imageUrl,
        onPressed: () {},
      );
    }).toList();
  }
}
