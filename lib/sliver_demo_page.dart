import 'package:flutter/material.dart';

class SliverDemoPage extends StatelessWidget {
  const SliverDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Sliver 实战示例'),
              background: Image.network(
                'https://picsum.photos/800/400',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Container(color: Colors.teal),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.blue[50],
              child: const Text(
                '欢迎回来！以下为您推荐的专属内容：',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverPersistentHeader(
            delegate: _StickyHeaderDelegate(title: '热门推荐（网格）'),
            pinned: true,
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9 + 1)],
                child: Text('网格项 #$index'),
              ),
              childCount: 6,
            ),
          ),
          SliverPersistentHeader(
            delegate: _StickyHeaderDelegate(title: '全部动态（线性列表）'),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                leading: const Icon(Icons.star),
                title: Text('列表项内容 #$index'),
                subtitle: const Text('这是副标题说明文字'),
              ),
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  _StickyHeaderDelegate({required this.title});

  final String title;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  @override
  double get maxExtent => 50.0;

  @override
  double get minExtent => 50.0;

  @override
  bool shouldRebuild(covariant _StickyHeaderDelegate oldDelegate) =>
      oldDelegate.title != title;
}
