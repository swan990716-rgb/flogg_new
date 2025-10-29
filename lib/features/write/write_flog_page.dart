import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/post.dart';
import '../../data/store/post_store.dart';
import '../../utils/image_picker_helper.dart';

/// 업로드 화면 (uuid 패키지 없이 ID 생성)
class WriteFlogPage extends StatefulWidget {
  const WriteFlogPage({super.key});

  @override
  State<WriteFlogPage> createState() => _WriteFlogPageState();
}

class _WriteFlogPageState extends State<WriteFlogPage> {
  Uint8List? _imageBytes;
  final _titleCtrl = TextEditingController();
  final _contentCtrl = TextEditingController();

  @override
  void dispose() {
    _titleCtrl.dispose();
    _contentCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final bytes = await ImagePickerHelper.pickImageBytes(context);
    if (!mounted) return;
    if (bytes != null && bytes.isNotEmpty) {
      setState(() => _imageBytes = bytes);
    }
  }

  void _submit() {
    if (_imageBytes == null) {
      _showSnack('사진을 업로드 해 주세요.');
      return;
    }
    if (_titleCtrl.text.trim().isEmpty) {
      _showSnack('제목을 입력해 주세요.');
      return;
    }

    // 간단한 고유 ID (시간 기반)
    final id = DateTime.now().microsecondsSinceEpoch.toString();

    final post = Post(
      id: id,
      title: _titleCtrl.text.trim(),
      content: _contentCtrl.text.trim(),
      createdAt: DateTime.now(),
      imageBytes: _imageBytes,
    );
    context.read<PostStore>().addPost(post);
    Navigator.pop(context);
  }

  void _showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('새 스토리 쓰기', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Card(
                child: Container(
                  height: 180,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: _imageBytes == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_a_photo,
                                size: 36, color: cs.primary),
                            const SizedBox(height: 8),
                            const Text('사진을 업로드 해 주세요'),
                          ],
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.memory(
                            _imageBytes!,
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _titleCtrl,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(hintText: '제목을 입력하세요'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _contentCtrl,
              maxLines: 6,
              decoration: const InputDecoration(hintText: '내용을 입력하세요'),
            ),
            const SizedBox(height: 12),
            Text(
              '※ 갤러리 권한이 거부되면 설정에서 접근 권한을 허용해 주세요.',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.black54),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _submit,
            child: const Text('Flogging'),
          ),
        ),
      ),
    );
  }
}
