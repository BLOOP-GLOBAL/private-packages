library shared_utils;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'colors.dart';
import 'spacing.dart';

/// extensions on any [Widget]
extension WidgetX on Widget {
  Widget bottom(double spacing) => Padding(
        padding: EdgeInsets.only(bottom: spacing),
        child: this,
      );

  Widget top(double spacing) => Padding(
        padding: EdgeInsets.only(top: spacing),
        child: this,
      );

  Widget left(double spacing) => Padding(
        padding: EdgeInsets.only(left: spacing),
        child: this,
      );

  Widget right(double spacing) => Padding(
        padding: EdgeInsets.only(right: spacing),
        child: this,
      );

  Widget clickable({required Function() onTap}) => InkWell(
        onTap: onTap,
        child: this,
      );

  Widget hero({required String tag}) => Hero(tag: tag, child: this);

  Widget withIndicator(BuildContext context,
          {bool show = true, bool left = false}) =>
      DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context)
                  .colorScheme
                  .primary
                  .withOpacity(kEmphasisMedium),
              style: show && !left ? BorderStyle.solid : BorderStyle.none,
              width: kSpacingX4,
            ),
            left: BorderSide(
              color: Theme.of(context)
                  .colorScheme
                  .primary
                  .withOpacity(kEmphasisMedium),
              style: show && left ? BorderStyle.solid : BorderStyle.none,
              width: kSpacingX4,
            ),
          ),
        ),
        child: this,
      );

  Widget circularClip(radius) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
        ),
        clipBehavior: Clip.hardEdge,
        child: this,
      );

  Widget withBadge(
    BuildContext context, {
    bool showAsIndicator = true,
    int count = 0,
  }) {
    var kTheme = Theme.of(context);

    /// show badge only when count > 0 or showAsIndicator is true
    var showBadge = showAsIndicator || count > 0;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        /// widget itself
        Positioned.fill(child: this),

        if (showBadge) ...{
          Positioned(
            child: Container(
              width: count > 0 ? kSpacingX16 : kSpacingX12,
              height: count > 0 ? kSpacingX16 : kSpacingX12,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: kTheme.colorScheme.error,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: showAsIndicator
                  ? null
                  : '${count > 99 ? '99+' : count}'.overline(
                      context,
                      color: kTheme.colorScheme.onError,
                    ),
            ),
          ),
        }
      ],
    );
  }

  Widget align(Alignment alignment) => Align(alignment: alignment, child: this);

  Widget centered() => Center(child: this);
}

extension IconX on Icon {
  Icon opacity(double emphasis) => Icon(
        icon,
        size: size,
        color:
            color?.withOpacity(emphasis) ?? kBlackColor.withOpacity(emphasis),
        semanticLabel: semanticLabel,
        textDirection: textDirection,
      );
}

/// extensions on any [String]
///
/// converts a [String] to a [Text][Widget]
extension TextX on String {
  Widget h4(
    BuildContext context, {
    Color? color,
    double emphasis = kEmphasisHigh,
    TextAlign alignment = TextAlign.start,
  }) =>
      FittedBox(
        fit: BoxFit.contain,
        child: Text(
          this,
          textAlign: alignment,
          style: Theme.of(context).textTheme.headline4?.copyWith(
              color: color ??
                  Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(emphasis)),
        ),
      );

  Widget h5(
    BuildContext context, {
    Color? color,
    double emphasis = kEmphasisHigh,
    TextAlign alignment = TextAlign.start,
  }) =>
      FittedBox(
        fit: BoxFit.contain,
        child: Text(
          this,
          textAlign: alignment,
          style: Theme.of(context).textTheme.headline5?.copyWith(
              color: color ??
                  Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(emphasis)),
        ),
      );

  Widget h6(
    BuildContext context, {
    Color? color,
    double emphasis = kEmphasisHigh,
    TextAlign alignment = TextAlign.start,
  }) =>
      FittedBox(
        fit: BoxFit.contain,
        child: Text(
          this,
          textAlign: alignment,
          style: Theme.of(context).textTheme.headline6?.copyWith(
              color: color ??
                  Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(emphasis)),
        ),
      );

  Widget bodyText1(
    BuildContext context, {
    Color? color,
    double emphasis = kEmphasisHigh,
    TextAlign alignment = TextAlign.start,
  }) =>
      FittedBox(
        fit: BoxFit.contain,
        child: Text(
          this,
          textAlign: alignment,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: color ??
                  Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(emphasis)),
        ),
      );

  Widget bodyText2(
    BuildContext context, {
    Color? color,
    double emphasis = kEmphasisHigh,
    TextAlign alignment = TextAlign.start,
  }) =>
      FittedBox(
        fit: BoxFit.contain,
        child: Text(
          this,
          textAlign: alignment,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
              color: color ??
                  Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(emphasis)),
        ),
      );

  Widget subtitle1(
    BuildContext context, {
    Color? color,
    double emphasis = kEmphasisHigh,
    TextAlign alignment = TextAlign.start,
  }) =>
      FittedBox(
        fit: BoxFit.contain,
        child: Text(
          this,
          textAlign: alignment,
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
              color: color ??
                  Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(emphasis)),
        ),
      );

  Widget subtitle2(
    BuildContext context, {
    Color? color,
    double emphasis = kEmphasisHigh,
    TextAlign alignment = TextAlign.start,
  }) =>
      FittedBox(
        fit: BoxFit.contain,
        child: Text(
          this,
          textAlign: alignment,
          style: Theme.of(context).textTheme.subtitle2?.copyWith(
              color: color ??
                  Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(emphasis)),
        ),
      );

  Widget caption(
    BuildContext context, {
    Color? color,
    double emphasis = kEmphasisHigh,
    TextAlign alignment = TextAlign.start,
  }) =>
      FittedBox(
        fit: BoxFit.contain,
        child: Text(
          this,
          textAlign: alignment,
          style: Theme.of(context).textTheme.caption?.copyWith(
              color: color ??
                  Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(emphasis)),
        ),
      );

  Widget overline(
    BuildContext context, {
    Color? color,
    double emphasis = kEmphasisHigh,
    TextAlign alignment = TextAlign.start,
  }) =>
      FittedBox(
        fit: BoxFit.contain,
        child: Text(
          this,
          textAlign: alignment,
          style: Theme.of(context).textTheme.overline?.copyWith(
              color: color ??
                  Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(emphasis)),
        ),
      );

  Widget textButton(BuildContext context, {required Function() onTap}) =>
      FittedBox(
        fit: BoxFit.contain,
        child: Text(
          this,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(kEmphasisMedium),
              ),
        ).clickable(onTap: onTap),
      );

  Widget asSvg({
    double? size,
    double? height,
    double? width,
    BoxFit fit = BoxFit.cover,
  }) {
    assert(size != null || (height != null && width != null));

    return SvgPicture.asset(
      this,
      height: size ?? height,
      width: size ?? width,
      fit: fit,
      placeholderBuilder: (_) => SizedBox.shrink(),
    );
  }

  Widget asAssetImage({
    double? size,
    double? height,
    double? width,
    BoxFit fit = BoxFit.cover,
  }) {
    assert(size != null || (height != null && width != null));
    return Image.asset(
      this,
      height: size ?? height,
      width: size ?? width,
      fit: fit,
    );
  }

  Widget asNetworkImage({
    double? size,
    double? height,
    double? width,
    BoxFit fit = BoxFit.cover,
  }) {
    assert(size != null || (height != null && width != null));
    return CachedNetworkImage(
      imageUrl: this,
      height: size ?? height,
      width: size ?? width,
      fit: fit,
      placeholder: (_, __) => Container(
        decoration: BoxDecoration(
          color: kPlaceholderColor,
        ),
        height: size ?? height,
        width: size ?? width,
      ),
      errorWidget: (_, __, ___) => Container(
        decoration: BoxDecoration(
          color: kPlaceholderColor,
        ),
        height: size ?? height,
        width: size ?? width,
      ),
    );
  }

  Widget avatar({
    required double size,
    bool fromAsset = false,
    BoxFit fit = BoxFit.cover,
  }) =>
      fromAsset
          ? asAssetImage(size: size, fit: fit).circularClip(size / 4)
          : asNetworkImage(size: size, fit: fit).circularClip(size / 4);

  String capitalize() => split(' ')
      .map((str) => '${str[0].toUpperCase()}${str.substring(1)}')
      .join(' ');
}

/// extensions on [BuildContext]
extension ContextX on BuildContext {
  /// navigator state
  NavigatorState get navigator => Navigator.of(this);

  /// shows a [SnackBar]
  void showSnackBar(String message) {
    var messenger = ScaffoldMessenger.of(this);
    messenger
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: message.bodyText1(
            this,
            color: Theme.of(this).colorScheme.onPrimary,
          ),
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(
            label: 'Dismiss',
            onPressed: () => messenger.hideCurrentSnackBar(),
          ),
        ),
      );
  }
}
