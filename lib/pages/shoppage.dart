import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage>
    with SingleTickerProviderStateMixin {
  bool showBottomBar = false;
  bool showAppBar = true;
  bool isScrollingDown = false;
  Duration animationDuration = const Duration(milliseconds: 500);
  late AnimationController animationController;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
    _scrollController = ScrollController()..addListener(onScrollListen);
  }

  @override
  void dispose() {
    animationController.dispose();
    _scrollController.dispose();
    _scrollController.removeListener(() {});
    super.dispose();
  }

  void onScrollListen() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (!isScrollingDown) {
        isScrollingDown = true;
        showAppBar = false;
        setState(() {});
      }
    }
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (isScrollingDown) {
        isScrollingDown = false;
        showAppBar = true;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        alignment: Alignment.topCenter,
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildTopNavBar(),
                  _buildListView(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: kToolbarHeight * 1.56,
            child: AnimatedSlide(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 250),
              offset: showAppBar ? const Offset(0.0, -1.0) : Offset.zero,
              child: AppBar(
                title: const Text('App Bar'),
                centerTitle: true,
                automaticallyImplyLeading: false,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopNavBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu_rounded,
                size: 20.0,
                color: Colors.black54,
              ),
            ),
            const SizedBox(width: 16.0),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_rounded,
                size: 20.0,
                color: Colors.black54,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Hello',
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 10.0),
              Text(
                'Peter Parker',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: 20,
      itemExtent: 160,
      shrinkWrap: true,
      controller: _scrollController,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
      itemBuilder: (context, index) {
        return Card(
          color: Colors.deepPurple.shade200,
          margin: const EdgeInsets.only(bottom: 10.0),
          child: Center(
            child: Text('data $index'),
          ),
        );
      },
    );
  }
}
