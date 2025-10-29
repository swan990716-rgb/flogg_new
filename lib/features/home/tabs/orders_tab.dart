import 'package:flutter/material.dart';

/// 구매 내역 탭: 현재는 플레이스홀더
class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        onPressed: () {},
        child: const Text('구매 내역 (준비 중)'),
      ),
    );
  }
}
