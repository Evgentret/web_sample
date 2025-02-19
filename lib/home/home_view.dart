import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_sample/home/home_controller.dart';
import 'widgets/menu_button.dart';

/// Home screen view.
///
/// Displaying image from user input URL using HTML <img> tag with full screen possibility.

class HomePage extends GetWidget<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      //uses just one state builder for all elements
      body: GetBuilder<HomeController>(builder: (_) {
        return Stack(
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
                        onDoubleTap: controller.toggleFullscreen,
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
                          controller: controller.urlController,
                          decoration: InputDecoration(hintText: 'Image URL'),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          controller.setImage(controller.urlController);
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
              visible: controller.isMenuVisible,
              child: GestureDetector(
                onTap: controller.closeMenu,
                child: Container(
                  color: Colors.black.withValues(alpha: 0.5),
                ),
              ),
            ),

            //bottom right menu buttons
            Visibility(
              visible: controller.isMenuVisible,
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
                          controller.setFullScreen(true);
                        },
                      ),
                      menuButton(
                        text: 'Exit fullscreen',
                        onPressed: () {
                          controller.setFullScreen(false);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),

      //...and standart floating button :)
      floatingActionButton: FloatingActionButton(
        onPressed: controller.toggleMenu,
        child: Icon(Icons.add),
      ),
    );
  }
}
