import 'dart:typed_data';
import 'package:catering/Domain/Security/security_service.dart';
import 'package:catering/core/injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class EncryptedImageWidget extends StatefulWidget {
  final String imageUrl;
  final String nonce;
  final String senderPublicKey;

  const EncryptedImageWidget({
    super.key,
    required this.imageUrl,
    required this.nonce,
    required this.senderPublicKey,
  });

  @override
  State<EncryptedImageWidget> createState() => _EncryptedImageWidgetState();
}

class _EncryptedImageWidgetState extends State<EncryptedImageWidget> {
  Uint8List? _decryptedBytes;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _downloadAndDecrypt();
  }

  Future<void> _downloadAndDecrypt() async {
    try {
      final dio = Dio();
      final response = await dio.get<List<int>>(
        widget.imageUrl,
        options: Options(responseType: ResponseType.bytes),
      );

      if (response.data == null) throw Exception("Empty data received");

      final encryptedBytes = Uint8List.fromList(response.data!);
      final securityService = getIt<SecurityService>();

      final decryptedBytes = await securityService.decryptBytes(
        encryptedBytes: encryptedBytes,
        nonceBase64: widget.nonce,
        senderPublicKey: widget.senderPublicKey,
      );

      if (mounted) {
        setState(() {
          _decryptedBytes = decryptedBytes;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Container(
        height: 200,
        width: double.infinity,
        color: Colors.white.withOpacity(0.05),
        child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
      );
    }

    if (_error != null || _decryptedBytes == null) {
      return Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.redAccent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.lock_outline, color: Colors.redAccent, size: 24),
              SizedBox(height: 8),
              Text("Decryption Error", style: TextStyle(color: Colors.redAccent, fontSize: 12)),
            ],
          ),
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.memory(
        _decryptedBytes!,
        fit: BoxFit.cover,
      ),
    );
  }
}
