import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/routes.dart';
import '../../../data/models/post.dart';
import '../../../data/store/post_store.dart';

/// 스토리 피드 탭
/// - 이미지 카드 + 제목 텍스트 목록 스크롤
/// - 우하단 고정 "Flogging" 버튼 → 업로드 화면
class StoryTab extends StatelessWidget {
  const StoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = context.watch<PostStore>().posts;

    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 8, bottom: 96),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final Post post = posts[index];
          return _PostCard(post: post);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, AppRoutes.write),
        label: const Text('Flogging'),
        icon: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class _PostCard extends StatelessWidget {
  final Post post;
  const _PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    final imageWidget = _buildImage(post);
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (imageWidget != null)
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: AspectRatio(aspectRatio: 16 / 9, child: imageWidget),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
            child: Text(
              post.title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
            child: Text(
              post.content,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  /// 이미지 유틸: 갤러리(Uint8List) 우선, 없으면 에셋
  Widget? _buildImage(Post p) {
    final Uint8List? bytes = p.imageBytes;
    if (bytes != null && bytes.isNotEmpty) {
      return Image.memory(bytes, fit: BoxFit.cover);
    }
    if (p.assetPath != null && p.assetPath!.isNotEmpty) {
      return Image.asset(p.assetPath!, fit: BoxFit.cover);
    }
    return null; // 이미지가 없어도 카드 렌더링은 진행
  }
}
