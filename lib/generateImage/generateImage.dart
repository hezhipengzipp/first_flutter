import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class GenerateImageRoute extends StatelessWidget {
  const GenerateImageRoute({super.key});

  Future<void> _saveImage() async {
    // Generate the image
    final Uint8List imageBytes = await _generateImage();

    // Save the image to the device's gallery
    await ImageGallerySaver.saveImage(imageBytes);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Generate Image'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.save_alt),
                label: const Text("保存图片"),
                onPressed: () {
                  _saveImage();
                },
              ),
              Center(
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
              ))
            ],
          ),
        ),
      ),
    );
  }

  Future<Uint8List> _generateImage() async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    // final firstImage = await _loadImage('assets/images/icon_test.png');
    final firstImage = await _loadNetImage(
        'https://sports-health-test.cos.clife.cn/31657/0025b45bd5e0174b2e5822a11a2ca258.png');
    // final secondImage = await _loadImage('assets/images/dog.jpg');
    final secondImage = await _loadNetImage(
        'https://sports-health-test.cos.clife.cn/31657/e84dd2bd32aeefc6c6001ef0a4c79917.png');

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
      Rect.fromLTWH(100, 60, firstImage.width.toDouble() - 200,
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

  Future<ui.Image> _loadNetImage(String url) async {
    // 使用Image.network加载网络图片
    final Completer<ui.Image> completer = Completer();
    final Uint8List data = (await NetworkAssetBundle(Uri.parse(url)).load(url))
        .buffer
        .asUint8List();
    ui.decodeImageFromList(Uint8List.view(data.buffer), (ui.Image img) {
      return completer.complete(img);
    });
    return completer.future;
  }
}
