// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

/// Insignia/Badge con animación de halo pulsante.
class NativePulseBadge extends StatefulWidget {
  final Widget child;
  final String? count;
  final Color badgeColor;
  final Duration duration;

  const NativePulseBadge({
    super.key,
    required this.child,
    this.count,
    this.badgeColor = const Color(0xFFD32F2F),
    this.duration = const Duration(milliseconds: 1400),
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
      duration: widget.duration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          widget.child,
          Positioned(
            top: -4,
            right: -4,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final scale = 1.0 + (_controller.value * 0.8);
                final opacity = (1.0 - _controller.value).clamp(0.0, 1.0);

                return Stack(
                  alignment: Alignment.center,
                  children: [
                    // Pulsing Halo Ring
                    Transform.scale(
                      scale: scale,
                      child: Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.badgeColor.withOpacity(opacity * 0.6),
                        ),
                      ),
                    ),
                    // Solid Badge Center
                    Container(
                      padding: const EdgeInsets.all(4),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      decoration: BoxDecoration(
                        color: widget.badgeColor,
                        shape: BoxShape.circle,
                      ),
                      child: widget.count != null
                          ? Text(
                              widget.count!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            )
                          : null,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
