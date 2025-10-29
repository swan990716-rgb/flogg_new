import 'package:flutter/material.dart';

/// 좌측 상단 고정 로고 위젯
class AppLogo extends StatelessWidget {
  final double size;
  const AppLogo({super.key, this.size = 24});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 로고 이미지 (없으면 빈 위젯 처리)
        Image.asset(
          'assets/logo/flogg_logo.png',
          width: size,
          height: size,
          errorBuilder: (_, __, ___) => const SizedBox.shrink(),
        ),
        const SizedBox(width: 8),
        Text(
          'FlogG',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ],
    );
  }
}
