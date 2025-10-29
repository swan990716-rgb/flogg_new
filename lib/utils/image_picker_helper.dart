import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// 갤러리에서 이미지를 선택해 Uint8List로 반환하는 유틸
/// - 예외 안전 처리 및 간단한 안내
class ImagePickerHelper {
  static final ImagePicker _picker = ImagePicker();

  static Future<Uint8List?> pickImageBytes(BuildContext context) async {
    try {
      final XFile? picked = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 2048, // 과도한 용량 방지
        imageQuality: 90,
      );
      if (picked == null) return null; // 사용자가 취소
      return await picked.readAsBytes();
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('이미지 선택에 실패했습니다: $e')));
      }
      return null;
    }
  }
}
