import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GenerateImageRoute extends StatelessWidget {
  const GenerateImageRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Generate Image'),
        ),
        body: Center(

          child: FutureBuilder<Uint8List>(
            future: _generateImage(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Container(
                  width: 600,
                  height: 600,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: MemoryImage(snapshot.data!),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<Uint8List> _generateImage() async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    final firstImage = await _loadImage('assets/images/icon_test.png');
    final secondImage = await _loadImage('assets/images/dog.jpg');

    // 绘制第一张图片
    canvas.drawImageRect(
      firstImage,
      Rect.fromLTWH(
          0, 0, firstImage.width.toDouble(), firstImage.height.toDouble()),
      // 指定绘制的矩形区域
      Rect.fromLTWH(
          0, 0, firstImage.width.toDouble(), firstImage.height.toDouble()),
      // 指定在画布上绘制的矩形区域和大小
      Paint(),
    );
    // 绘制第二张图片，确保位置不超出绘制范围
    canvas.drawImageRect(
      secondImage,
      Rect.fromLTWH(
          0, 0, secondImage.width.toDouble(), secondImage.height.toDouble()),
      // 指定绘制的矩形区域
      Rect.fromLTWH(60, 60, firstImage.width.toDouble() -120,
          firstImage.height.toDouble() - 120),
      // 指定在画布上绘制的矩形区域和大小
      Paint(),
    );

    final img = await recorder
        .endRecording()
        .toImage(firstImage.width, firstImage.height);
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);

    return byteData!.buffer.asUint8List();
  }

  Future<ui.Image> _loadImage(String path) async {
    final data = await rootBundle.load(path);
    final codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    final frame = await codec.getNextFrame();
    return frame.image;
  }
}
