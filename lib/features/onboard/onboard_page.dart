import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/routes.dart';
import '../../core/widgets/app_logo.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  bool _showLogin = false;
  Timer? _timer;

  // ✅ 실제 사용하는 이미지 파일명 (지은님 환경 기준)
  static const String kMainImage = 'assets/images/main.jpg';
  static const String kQuoteImage = 'assets/images/onboard_quote.png';

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), () {
      if (mounted) setState(() => _showLogin = true);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _goHome() => Navigator.pushReplacementNamed(context, AppRoutes.home);

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: const Color(0xFFFCF8F8), // 부드러운 파스텔 톤 배경
      appBar: AppBar(title: const AppLogo()),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 상단 여백
            const SizedBox(height: 20),

            // 🌸 메인 이미지 (꽃 든 여자)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 4 / 5, // 자연스러운 인물 사진 비율
                  child: Image.asset(
                    kMainImage,
                    fit: BoxFit.cover, // 이미지 잘림 방지하고 화면에 꽉 차게
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🌷 글귀 이미지
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Image.asset(
                kQuoteImage,
                fit: BoxFit.contain,
                height: 100, // 문구 이미지 세로 크기
              ),
            ),

            const Spacer(),

            // 권한 안내
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '※ 갤러리 접근 권한이 필요합니다. 사진 선택 시 허용을 눌러주세요.',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),

            // 로그인 버튼 (2초 뒤 페이드인)
            AnimatedOpacity(
              opacity: _showLogin ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 600),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _showLogin ? _goHome : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB4707B), // 파스텔 핑크 포인트
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      '로그인하기',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
