import 'dart:typed_data';

/// 스토리 게시글 모델
class Post {
  final String id; // 고유 ID
  final Uint8List? imageBytes; // 갤러리 선택 이미지
  final String? assetPath; // 시드용 에셋 이미지
  final String title;
  final String content;
  final DateTime createdAt;

  const Post({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    this.imageBytes,
    this.assetPath,
  });
}
