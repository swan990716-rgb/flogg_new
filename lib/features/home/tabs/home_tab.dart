import 'package:flutter/material.dart';

/// 홈 탭: 현재는 플레이스홀더
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilledButton.tonal(
        onPressed: () {},
        child: const Text('홈 (준비 중)'),
      ),
    );
  }
}
