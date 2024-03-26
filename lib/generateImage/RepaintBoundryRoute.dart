import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:image_gallery_saver/image_gallery_saver.dart';

class RepaintBoundryRoute extends StatelessWidget {
  const RepaintBoundryRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Save Poster Image'),
        ),
        body: Center(
          child: PosterImage(),
        ),
      ),
    );
  }
}

class PosterImage extends StatelessWidget {
  GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _globalKey,
      child: Stack(
        children: [
          // 背景图片
          Image.asset(
            'assets/images/icon_border.png', // 背景图片路径
            width: 600, // 图片宽度
            height: 900, // 图片高度
            fit: BoxFit.cover, // 图片填充方式
          ),
          // 海报图片
          Positioned(
            top: 70, // 海报图片的顶部偏移量
            left: 70, // 海报图片的左侧偏移量
            child: Image.asset(
              'assets/images/me.jpg', // 海报图片路径
              width: 460, // 图片宽度
              height: 760, // 图片高度
              fit: BoxFit.contain, // 图片填充方式
            ),
          ),
          Positioned(
            // 海报图片的顶部偏移量
            child: ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text("保存到相册"),
              onPressed: () {
                _savePoster();
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _savePoster() async {
    RenderRepaintBoundary boundary =
    _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    await ImageGallerySaver.saveImage(pngBytes);
  }

  // Future<void> _savePoster() async {
  //   RenderRepaintBoundary boundary =
  //       _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  //   ui.Image image = await boundary.toImage(pixelRatio: 3); // 设置像素密度以保持高清
  //   ByteData? byteData =
  //       await image.toByteData(format: ui.ImageByteFormat.rawUnmodified);
  //   ByteBuffer pngBytes = byteData!.buffer;
  //
  //   // 使用image库保存高清图像
  //   img.Image imgImage = img.Image.fromBytes(
  //       width: image.width, height: image.height, bytes: pngBytes);
  //   File('poster.png').writeAsBytesSync(img.encodePng(imgImage));
  // }
}
