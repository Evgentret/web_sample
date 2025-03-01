import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widget/menu_button.dart';
import 'controller.dart';

/// View of the Home page.
///
/// Displaying image from user input URL using HTML <img> tag with full screen possibility.
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (HomeController c) {
          return Scaffold(
            appBar: AppBar(),
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //image view element
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: GestureDetector(
                            onDoubleTap: c.toggleFullscreen,
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const HtmlElementView(
                                  viewType: 'image-view',
                                )),
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      //user input controls
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: c.urlController,
                              decoration:
                                  InputDecoration(hintText: 'Image URL'),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              c.setImage(c.urlController.text);
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                              child: Icon(Icons.arrow_forward),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 64),
                    ],
                  ),
                ),

                // shading background when menu is visible
                Visibility(
                  visible: c.isMenuVisible,
                  child: GestureDetector(
                    onTap: c.closeMenu,
                    child: Container(
                      color: Colors.black.withValues(alpha: 0.5),
                    ),
                  ),
                ),

                //bottom right menu buttons
                Visibility(
                  visible: c.isMenuVisible,
                  child: Positioned(
                    right: 16,
                    bottom: 80,
                    child: Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      elevation: 4,
                      child: Column(
                        children: [
                          menuButton(
                            text: 'Enter fullscreen',
                            onPressed: () {
                              c.setFullScreen(true);
                            },
                          ),
                          menuButton(
                            text: 'Exit fullscreen',
                            onPressed: () {
                              c.setFullScreen(false);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //...and standard floating button :)
            floatingActionButton: FloatingActionButton(
              onPressed: c.toggleMenu,
              child: Icon(Icons.add),
            ),
          );
        });
  }
}
