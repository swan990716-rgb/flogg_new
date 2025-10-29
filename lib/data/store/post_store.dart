import 'dart:collection';
import 'package:flutter/foundation.dart';
import '../models/post.dart';

/// ChangeNotifier로 로컬 상태 관리
/// - 피드 상단 삽입
class PostStore extends ChangeNotifier {
  final List<Post> _posts = [];

  UnmodifiableListView<Post> get posts => UnmodifiableListView(_posts);

  /// 더미 데이터 주입 (앱 최초 실행 시)
  void seed() {
    if (_posts.isNotEmpty) return;
    _posts.addAll([
      //  Post(
      //     id: 'seed_1',
      //     title: '봄 햇살 산책',
      //     content: '라벤더 향이 스며든 오후 🌷',
      //     createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      //     assetPath: 'assets/images/placeholder_1.jpg',
      //   ),
      //   Post(
      //     id: 'seed_2',
      //     title: 'FlogG 테스트',
      //     content: '이미지 + 제목 + 내용이 들어갑니다.',
      //     createdAt: DateTime.now().subtract(const Duration(days: 1)),
      //     assetPath: 'assets/images/placeholder_2.jpg',
      //   ),
    ]);
    notifyListeners();
  }

  /// 글 추가: 피드 최상단에 삽입
  void addPost(Post post) {
    _posts.insert(0, post);
     notifyListeners();
  }
}
