/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/facebook.png
  AssetGenImage get facebook =>
      const AssetGenImage('assets/icons/facebook.png');

  /// File path: assets/icons/google.png
  AssetGenImage get google => const AssetGenImage('assets/icons/google.png');

  /// File path: assets/icons/payoneer.png
  AssetGenImage get payoneer =>
      const AssetGenImage('assets/icons/payoneer.png');

  /// File path: assets/icons/paypal.png
  AssetGenImage get paypal => const AssetGenImage('assets/icons/paypal.png');

  /// File path: assets/icons/visa.png
  AssetGenImage get visa => const AssetGenImage('assets/icons/visa.png');

  /// List of all assets
  List<AssetGenImage> get values => [facebook, google, payoneer, paypal, visa];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/background_dark.png
  AssetGenImage get backgroundDark =>
      const AssetGenImage('assets/images/background_dark.png');

  /// File path: assets/images/background_light.png
  AssetGenImage get backgroundLight =>
      const AssetGenImage('assets/images/background_light.png');

  /// File path: assets/images/circlo.png
  AssetGenImage get circlo => const AssetGenImage('assets/images/circlo.png');

  /// File path: assets/images/cloudy_food.png
  AssetGenImage get cloudyFood =>
      const AssetGenImage('assets/images/cloudy_food.png');

  /// File path: assets/images/draft_humbergure.png
  AssetGenImage get draftHumbergure =>
      const AssetGenImage('assets/images/draft_humbergure.png');

  /// File path: assets/images/haty.png
  AssetGenImage get haty => const AssetGenImage('assets/images/haty.png');

  /// File path: assets/images/healthy.png
  AssetGenImage get healthy => const AssetGenImage('assets/images/healthy.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/lovy_food.png
  AssetGenImage get lovyFood =>
      const AssetGenImage('assets/images/lovy_food.png');

  /// File path: assets/images/maww.jpg
  AssetGenImage get maww => const AssetGenImage('assets/images/maww.jpg');

  /// File path: assets/images/recto.png
  AssetGenImage get recto => const AssetGenImage('assets/images/recto.png');

  /// File path: assets/images/splash_bg.png
  AssetGenImage get splashBg =>
      const AssetGenImage('assets/images/splash_bg.png');

  /// File path: assets/images/success.png
  AssetGenImage get success => const AssetGenImage('assets/images/success.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        backgroundDark,
        backgroundLight,
        circlo,
        cloudyFood,
        draftHumbergure,
        haty,
        healthy,
        logo,
        lovyFood,
        maww,
        recto,
        splashBg,
        success
      ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/menu.svg
  String get menu => 'assets/svg/menu.svg';

  /// List of all assets
  List<String> get values => [menu];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
