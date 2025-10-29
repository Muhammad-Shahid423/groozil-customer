import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groozil_app/core/constants/assets_constants.dart';
import 'package:groozil_app/shared/theme/app_sizes.dart';
import 'package:groozil_app/shared/widgets/loading/shimmer_loading.dart';

enum ClipShape {
  rectangle,
  circle,
}

/// A unified image widget that supports:
/// - Network images (raster + svg)
/// - Asset images (raster + svg)
/// - Local file images
/// - Placeholder shimmer
/// - Error fallback asset
/// - Hero animation
/// - Optional clipping (circle / rounded rect)
/// - Semantics label for accessibility
///
/// Notes:
/// - For Hero to animate cleanly, make sure all routes that share the same
///   [heroTag] also pass the same [width]/[height]/[borderRadius]/[clipShape].
class AppImage extends StatelessWidget {

  const AppImage({
    required this.path, super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.clipShape = ClipShape.rectangle,
    this.borderRadius,
    this.enableShimmer = true,
    this.placeholder,
    this.errorWidget,
    this.fallbackAsset = AssetsConstants.placeholder,
    this.semanticsLabel,
    this.heroTag,
    this.colorFilter,
  });

  final String path;

  final double? width;
  final double? height;
  final BoxFit fit;

  final ClipShape clipShape;
  final BorderRadius? borderRadius;

  final bool enableShimmer;
  final Widget? placeholder;
  final Widget? errorWidget;
  final String fallbackAsset;

  final String? semanticsLabel;
  final String? heroTag;

  final ColorFilter? colorFilter;

  /// Is this a remote URL?
  bool get _isNetwork =>
      path.startsWith('http://') || path.startsWith('https://');

  /// Does the path end with .svg (case-insensitive)?
  bool get _isSvg => path.toLowerCase().endsWith('.svg');

  /// Heuristic: looks like a local file path?
  /// - starts with "/" (android, iOS sandbox)
  /// - OR contains "\" (windows-style, just in case)
  bool get _looksLikeFileSystemPath =>
      path.startsWith('/') || path.contains(r'\');

  /// If it's not network and not a file path, we treat it as an asset path.
  bool get _looksLikeAsset => !_isNetwork && !_looksLikeFileSystemPath;

  @override
  Widget build(BuildContext context) {
    // Early fallback if there's no path at all
    if (path.trim().isEmpty) {
      return _buildSemanticWrapper(
        context,
        _applyHeroAndClip(context, _fallback(context)),
      );
    }

    final baseImage = _buildBaseImage(context);
    final finalImage = _applyHeroAndClip(context, baseImage);

    return _buildSemanticWrapper(context, finalImage);
  }

  /// Builds the raw image widget with no clip/hero/semantics wrappers.
  Widget _buildBaseImage(BuildContext context) {
    if (_isNetwork) {
      return _buildNetworkImage(context);
    }

    if (_looksLikeFileSystemPath) {
      return _buildFileImage(context);
    }

    if (_looksLikeAsset) {
      return _buildAssetImage(context);
    }

    // Unknown case → fallback
    return _fallback(context);
  }

  /// Applies ClipOval / ClipRRect and Hero (in that order).
  Widget _applyHeroAndClip(BuildContext context, Widget child) {
    // Handle clipping first.
    var clipped = child;
    if (clipShape == ClipShape.circle) {
      clipped = ClipOval(child: clipped);
    } else if (borderRadius != null) {
      clipped = ClipRRect(
        borderRadius: borderRadius!,
        child: clipped,
      );
    }

    // Then handle Hero.
    if (heroTag != null) {
      clipped = Hero(
        tag: heroTag!,
        child: clipped,
      );
    }

    return clipped;
  }

  /// Wrap with semantics *only if* semanticsLabel is provided.
  Widget _buildSemanticWrapper(BuildContext context, Widget child) {
    if (semanticsLabel == null) return child;

    return Semantics(
      label: semanticsLabel,
      child: child,
    );
  }

  /// --- NETWORK IMAGES -----------------------------------------------------

  Widget _buildNetworkImage(BuildContext context) {
    if (_isSvg) {
      // Network SVG
      return SvgPicture.network(
        path,
        width: width?.w,
        height: height?.h,
        fit: fit,
        colorFilter: colorFilter,
        placeholderBuilder: (_) =>
        placeholder ?? (enableShimmer ? _fadeShimmerPlaceholder() : const SizedBox()),
      );
    }

    // Network raster
    return CachedNetworkImage(
      imageUrl: path,
      fit: fit,
      width: width?.w,
      height: height?.h,
      memCacheWidth: _cacheDimension(context, width),
      memCacheHeight: _cacheDimension(context, height),
      placeholder: (_, _) =>
      placeholder ?? (enableShimmer ? _fadeShimmerPlaceholder() : const SizedBox()),
      errorWidget: (_, _, _) => errorWidget ?? _defaultError(context),
    );
  }

  /// --- ASSET IMAGES -------------------------------------------------------

  Widget _buildAssetImage(BuildContext context) {
    if (_isSvg) {
      return SvgPicture.asset(
        path,
        width: width?.w,
        height: height?.h,
        fit: fit,
        colorFilter: colorFilter,
      );
    }

    return Image.asset(
      path,
      key: ValueKey(path),
      width: width?.w,
      height: height?.h,
      fit: fit,
      errorBuilder: (_, _, _) => errorWidget ?? _defaultError(context),
    );
  }

  /// --- FILE IMAGES --------------------------------------------------------

  Widget _buildFileImage(BuildContext context) {
    // We do NOT sync-check File.existsSync() here to avoid blocking the UI.
    // If the file is missing or unreadable, errorBuilder will catch it.
    return Image.file(
      File(path),
      key: ValueKey(path),
      width: width?.w,
      height: height?.h,
      fit: fit,
      errorBuilder: (_, _, _) => errorWidget ?? _defaultError(context),
    );
  }

  /// --- PLACEHOLDERS / ERRORS / FALLBACKS ----------------------------------

  Widget _fadeShimmerPlaceholder() {
    final resolvedW = width?.w ?? height?.h ?? 100.w;
    final resolvedH = height?.h ?? width?.w ?? 100.h;

    return ShimmerLoading(
      width: resolvedW,
      height: resolvedH,
      borderRadius: clipShape == ClipShape.circle ? null : AppSizes.radiusM,
      isCircle: clipShape == ClipShape.circle,
    );
  }

  Widget _defaultError(BuildContext context) => Image.asset(
    fallbackAsset,
    width: width?.w,
    height: height?.h,
    fit: fit,
  );

  Widget _fallback(BuildContext context) => _defaultError(context);

  /// --- MEMORY CACHE HELPERS ----------------------------------------------

  /// Convert logical px to cache px based on DPR so CachedNetworkImage
  /// doesn't cache giant originals unnecessarily.
  int? _cacheDimension(BuildContext context, double? logical) {
    if (logical == null) return null;
    final dpr = MediaQuery.devicePixelRatioOf(context);
    return (logical * dpr).round();
  }
}
