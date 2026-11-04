import 'package:flutter/material.dart';

/// Insignia de notificación con pulso expansivo suave.
class NativePulseBadge extends StatefulWidget {
  final Widget child;
  final String? count;
  final Color badgeColor;

  const NativePulseBadge({
    super.key,
    required this.child,
    this.count,
    this.badgeColor = const Color(0xFFE53935),
  });

  @override
  State<NativePulseBadge> createState() => _NativePulseBadgeState();
}

class _NativePulseBadgeState extends State<NativePulseBadge>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        widget.child,
        Positioned(
          top: -3,
          right: -3,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final scale = 1.0 + _controller.value * 0.6;
              final opacity = 1.0 - _controller.value;

              return Stack(
                alignment: Alignment.center,
                children: [
                  Transform.scale(
                    scale: scale,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.badgeColor.withValues(alpha: opacity * 0.6),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: widget.badgeColor,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 10,
                      minHeight: 10,
                    ),
                    child: widget.count != null
                        ? Text(
                            widget.count!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : null,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
