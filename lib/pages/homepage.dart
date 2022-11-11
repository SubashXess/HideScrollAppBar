// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  bool _isAppBarShow = true;
  Duration duration = kThemeAnimationDuration;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(onListen);
    super.dispose();
  }

  void onListen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          setState(() {
            if (_scrollController.position.pixels > 10.0) {
              _isAppBarShow = false;
              print('false');
            } else if (_scrollController.position.pixels < 20.0) {
              _isAppBarShow = true;
              print('true');
            }
          });
          return false;
        },
        child: SizedBox(
          width: double.infinity,
          // height: size.height,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              SingleChildScrollView(
                controller: _scrollController,
                child: SafeArea(
                  child: Column(
                    children: [
                      AnimatedOpacity(
                        opacity: _isAppBarShow ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 50),
                        child: AppBar(
                          centerTitle: true,
                          automaticallyImplyLeading: false,
                          backgroundColor: Colors.white,
                          elevation: 0.0,
                          title: const Text(
                            'Scroll AppBar',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          actions: [
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
                      ),
                      Container(
                        height: 250.0,
                        margin: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.deepPurple.shade200,
                        ),
                        child: const Center(
                          child: Text('data'),
                        ),
                      ),
                      Container(
                        height: 250.0,
                        margin: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.deepPurple.shade200,
                        ),
                        child: const Center(
                          child: Text('data'),
                        ),
                      ),
                      Container(
                        height: 250.0,
                        margin: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.deepPurple.shade200,
                        ),
                        child: const Center(
                          child: Text('data'),
                        ),
                      ),
                      Container(
                        height: 250.0,
                        margin: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.deepPurple.shade200,
                        ),
                        child: const Center(
                          child: Text('data'),
                        ),
                      ),
                      Container(
                        height: 250.0,
                        margin: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.deepPurple.shade200,
                        ),
                        child: const Center(
                          child: Text('data'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AnimatedSlide(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeInOut,
                  // opacity: _isAppBarShow ? 0.0 : 1.0,
                  offset: _isAppBarShow ? const Offset(0.0, -1.0) : Offset.zero,
                  child: AppBar(
                    scrolledUnderElevation: 1.0,
                    leadingWidth: 0.0,
                    titleSpacing: 0.0,
                    automaticallyImplyLeading: false,
                    elevation: 0.0,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                left: 0.0,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    size: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const Text('Scroll AppBar'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Container(
                          width: size.width,
                          height: 40.0,
                          margin: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              isDense: false,
                              hintText: 'Search',
                              filled: true,
                              fillColor: Colors.white54,
                              contentPadding: EdgeInsets.zero,
                              prefixIcon: const Icon(
                                Icons.search_rounded,
                                size: 20.0,
                                color: Colors.black45,
                              ),
                              hintStyle: const TextStyle(
                                  color: Colors.black45, fontSize: 14.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    toolbarHeight: kToolbarHeight * 2,
                    backgroundColor: Colors.deepPurple,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
