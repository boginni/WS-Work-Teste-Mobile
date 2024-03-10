import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class VerticalCard extends StatelessWidget {
  const VerticalCard({
    super.key,
    required this.imageBackgroundColor,
    this.backgroundColor,
    this.skeleton = false,
    required this.child,
    this.imageProvider,
  });

  factory VerticalCard.skeleton() {
    return VerticalCard(
      imageBackgroundColor: Colors.grey[300]!,
      backgroundColor: Colors.white,
      skeleton: true,
      child: const SizedBox.shrink(),
    );
  }

  static Size size = Size(176, 260);
  static Size imageSize = Size(size.width, 160);

  final Widget child;
  final Color imageBackgroundColor;
  final Color? backgroundColor;
  final bool skeleton;
  final ImageProvider? imageProvider;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
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
                height: 160,
                width: size.width,
                child: Material(
                  color: imageBackgroundColor,
                  child: imageProvider != null ? Image(image: imageProvider!) : null,
                ),
              ),
              // child
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
            height: VerticalCard.imageSize.height,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              SkeletonLine(
                style: SkeletonLineStyle(
                  height: 16,
                ),
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
