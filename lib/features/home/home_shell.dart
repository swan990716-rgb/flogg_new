import 'package:flutter/material.dart';
import '../../core/widgets/app_logo.dart';
import 'tabs/home_tab.dart';
import 'tabs/story_tab.dart';
import 'tabs/orders_tab.dart';

/// 하단 네비게이션 쉘
class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 1;
  final _pages = const [HomeTab(), StoryTab(), OrdersTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AppLogo()),
      body: IndexedStack(index: _index, children: _pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: '홈'),
          NavigationDestination(icon: Icon(Icons.photo), label: '스토리'),
          NavigationDestination(icon: Icon(Icons.receipt_long), label: '구매 내역'),
        ],
      ),
    );
  }
}
