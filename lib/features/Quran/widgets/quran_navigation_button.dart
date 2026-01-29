import 'package:flutter/material.dart';
import 'package:sakina/core/utils/constant.dart';

class QuranNavigationButton extends StatefulWidget {
  final IconData icon;
  final bool isEnabled;
  final VoidCallback onPressed;
  final String tooltip;

  const QuranNavigationButton({
    super.key,
    required this.icon,
    required this.isEnabled,
    required this.onPressed,
    required this.tooltip,
  });

  @override
  State<QuranNavigationButton> createState() => _QuranNavigationButtonState();
}

class _QuranNavigationButtonState extends State<QuranNavigationButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;
  bool _pressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scale = Tween(
      begin: 1.0,
      end: 0.9,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip,
      child: GestureDetector(
        onTapDown: (_) {
          if (!widget.isEnabled) return;
          setState(() => _pressed = true);
          _controller.forward();
        },
        onTapUp: (_) {
          _controller.reverse();
          setState(() => _pressed = false);
        },
        onTapCancel: () {
          _controller.reverse();
          setState(() => _pressed = false);
        },
        onTap: widget.isEnabled ? widget.onPressed : null,
        child: ScaleTransition(
          scale: _scale,
          child: Container(
            width: 56,
            height: 56,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: widget.isEnabled
                  ? AppColors.goldMedium.withOpacity(_pressed ? 0.3 : 0.2)
                  : AppColors.overlayDark,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: widget.isEnabled
                    ? AppColors.borderMedium
                    : AppColors.borderWhiteLight,
                width: 1.5,
              ),
              boxShadow: widget.isEnabled
                  ? [
                      BoxShadow(
                        color: AppColors.shadowGold,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null,
            ),
            child: Icon(
              widget.icon,
              size: 28,
              color: widget.isEnabled
                  ? AppColors.goldLight
                  : AppColors.textMuted,
            ),
          ),
        ),
      ),
    );
  }
}
