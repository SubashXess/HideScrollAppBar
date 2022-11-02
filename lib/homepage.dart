// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
            if (_scrollController.position.pixels > 20.0) {
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
                      AppBar(
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
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  offset: _isAppBarShow ? const Offset(0, -1.0) : Offset.zero,
                  child: AppBar(
                    centerTitle: true,
                    scrolledUnderElevation: 1.0,
                    leadingWidth: 0.0,
                    titleSpacing: 0.0,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Scroll AppBar'),
                        const SizedBox(height: 10.0),
                        Container(
                          height: 40.0,
                          width: size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Search',
                              filled: true,
                              fillColor: Colors.white54,
                              hintStyle: const TextStyle(
                                  color: Colors.black45, fontSize: 14.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none),
                              prefixIcon: const Icon(
                                Icons.search_rounded,
                                size: 18.0,
                                color: Colors.black45,
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

// AnimatedSlide(
          //         duration: duration,
          //         curve: Curves.easeInOut,
          //         offset: _isAppBarShow ? const Offset(0, -1.0) : Offset.zero,
          //         child: Container(
          //           width: double.infinity,
          //           height: kToolbarHeight * 4,
          //           decoration: const BoxDecoration(color: Colors.deepPurple),
          //           child: const SafeArea(
          //             child: Text('Scroll AppBar'),
          //           ),
          //         ),
          //       ),


//  CustomScrollView(
//         slivers: [
//           const SliverAppBar(
//             title: Text(
//               'Scroll AppBar',
//               style: TextStyle(color: Colors.black),
//             ),
//             automaticallyImplyLeading: false,
//             expandedHeight: kTextTabBarHeight,
//             backgroundColor: Colors.white,
//             scrolledUnderElevation: 1.0,
//             floating: false,
//             pinned: true,
//           ),
//           SliverToBoxAdapter(
//             child: Container(
//               height: 250.0,
//               margin: const EdgeInsets.all(16.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16.0),
//                 color: Colors.deepPurple.shade200,
//               ),
//               child: const Center(
//                 child: Text('data'),
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Container(
//               height: 250.0,
//               margin: const EdgeInsets.all(16.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16.0),
//                 color: Colors.deepPurple.shade200,
//               ),
//               child: const Center(
//                 child: Text('data'),
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Container(
//               height: 250.0,
//               margin: const EdgeInsets.all(16.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16.0),
//                 color: Colors.deepPurple.shade200,
//               ),
//               child: const Center(
//                 child: Text('data'),
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Container(
//               height: 250.0,
//               margin: const EdgeInsets.all(16.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16.0),
//                 color: Colors.deepPurple.shade200,
//               ),
//               child: const Center(
//                 child: Text('data'),
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Container(
//               height: 250.0,
//               margin: const EdgeInsets.all(16.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16.0),
//                 color: Colors.deepPurple.shade200,
//               ),
//               child: const Center(
//                 child: Text('data'),
//               ),
//             ),
//           ),
//         ],
//       ),