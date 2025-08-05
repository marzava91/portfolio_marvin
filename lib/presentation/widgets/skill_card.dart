import 'package:flutter/material.dart';
import 'package:nimbus/presentation/widgets/circular_container.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';

class SkillCardData {
  final String title;
  final String description;
  final IconData iconData;

  SkillCardData({required this.title, required this.iconData,required this.description});
}

class SkillCard extends StatefulWidget {
  SkillCard({
    this.title = "",
    this.description = "",
    this.titleStyle,
    this.descriptionStyle,
    this.width,
    this.height,
    this.iconSize = 40,
    this.elevation = Sizes.ELEVATION_4,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.backgroundColor = AppColors.white,
    this.iconData = Icons.phone,
    this.iconColor = AppColors.white,
    this.iconBackgroundColor = AppColors.black,
    this.child,
    this.onHoverChild,
  });

  final String title;
  final String description;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final double? width;
  final double? height;
  final double iconSize;
  final double elevation;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final Color iconColor;
  final Color iconBackgroundColor;
  final IconData iconData;
  final Widget? child;
  final Widget? onHoverChild;

  @override
  _SkillCardState createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool _isHovering = false;

  void _onEnter(PointerEvent event) {
    setState(() => _isHovering = true);
  }

  void _onExit(PointerEvent event) {
    setState(() => _isHovering = false);
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    final double size = isDesktop
        ? (widget.width ?? 400) // cuadrado fijo para desktop
        : widget.width ?? double.infinity;

    final double height = isDesktop
        ? size
        : widget.height ?? 180;

    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: Container(
          key: ValueKey(_isHovering),
          width: size,
          height: height,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius,
          ),
          child: _isHovering ? onHoverChild() : defaultChild(),
        ),
      ),
    );
  }

  Widget defaultChild() {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      color: widget.backgroundColor,
      elevation: widget.elevation,
      shape: RoundedRectangleBorder(borderRadius: widget.borderRadius),
      child: Container(
        key: Key("default"),
        child: widget.child ??
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularContainer(
                  backgroundColor: widget.iconBackgroundColor,
                  padding: const EdgeInsets.all(24),
                  borderRadius: const BorderRadius.all(Radius.circular(60)),
                  iconData: widget.iconData,
                  iconColor: widget.iconColor,
                  iconSize: widget.iconSize+6,
                ),
                SpaceH12(),
                SelectableText(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: widget.titleStyle ?? textTheme.titleLarge,
                ),
              ],
            ),
      ),
    );
  }

  Widget onHoverChild() {
    TextTheme textTheme = Theme.of(context).textTheme;
    return widget.onHoverChild ??
        Stack(
          children: [
            ClipRRect(
              borderRadius: widget.borderRadius,
              child: Opacity(
                opacity: 0.9,
                child: Image.asset(
                  ImagePath.ICON_BOX,
                  width: widget.width,
                  height: widget.height,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: widget.titleStyle ??
                        textTheme.titleLarge?.copyWith(
                          color: AppColors.white,
                        ),
                  ),
                  SpaceH8(),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 260, // Para evitar que se expanda de más
                    ),
                    child: Text(
                      widget.description,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: widget.descriptionStyle ??
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.primaryText1,
                              ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
    // Container(
    //   key: Key("onHover"),
    //   child: Stack(
    //     children: [
    //       Image.asset(
    //         ImagePath.ICON_BOX,
    //         fit: BoxFit.fill,
    //       ),
    //     ],
    //   ),
    // );
  }
}
