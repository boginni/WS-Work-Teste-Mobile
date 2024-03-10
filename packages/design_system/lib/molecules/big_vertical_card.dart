import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class BigVerticalCard extends StatelessWidget {
  const BigVerticalCard({
    super.key,
    required this.imageBackgroundColor,
    this.backgroundColor,
    this.skeleton = false,
    required this.child,
    this.imageProvider,
  });

  factory BigVerticalCard.skeleton() {
    return BigVerticalCard(
      imageBackgroundColor: Colors.grey[300]!,
      backgroundColor: Colors.white,
      skeleton: true,
      child: const SizedBox.shrink(),
    );
  }

  static double height = 480;
  static double imageHeight = 240;

  final Widget child;
  final Color imageBackgroundColor;
  final Color? backgroundColor;
  final bool skeleton;
  final ImageProvider? imageProvider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Material(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.antiAlias,
        child: Visibility(
          visible: !skeleton,
          replacement: SkeletonVerticalCard(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: imageHeight,
                width: double.infinity,
                child: Material(
                  color: imageBackgroundColor,
                  child: imageProvider != null ? Image(image: imageProvider!) : null,
                ),
              ),
              Expanded(
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SkeletonVerticalCard extends StatelessWidget {
  const SkeletonVerticalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SkeletonLine(
          style: SkeletonLineStyle(
            height: BigVerticalCard.imageHeight,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              SkeletonLine(
                style: SkeletonLineStyle(height: 16, width: 160),
              ),
              const SizedBox(height: 8),
              SkeletonLine(
                style: SkeletonLineStyle(
                  height: 16,
                  width: 100,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
