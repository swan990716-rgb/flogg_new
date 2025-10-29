import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme.dart';
import 'core/routes.dart';
import 'data/store/post_store.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FlogGApp());
}

class FlogGApp extends StatelessWidget {
  const FlogGApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 앱 전역 상태 주입: PostStore
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PostStore()..seed())],
      child: MaterialApp(
        title: 'FlogG',
        debugShowCheckedModeBanner: false,
        theme: buildLightTheme(), // Material 3 라이트 테마
        onGenerateRoute: AppRoutes.onGenerateRoute,
        initialRoute: AppRoutes.onboard, // '/' → 온보딩
      ),
    );
  }
}
