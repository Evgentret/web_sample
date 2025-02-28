import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web/web.dart' as html;
import 'dart:ui_web' as ui;
import '../../../util/web/fullscreen.dart';

/// Controller for managing states of home screen view.
///
/// It involves refreshing the entire screen.

class HomeController extends GetxController {
  /// Image URL that will be displayed.
  String? imageUrl;

  ///Whether bottom right menu is showed.
  bool isMenuVisible = false;

  ///Image element HTML id
  final imageElementId = 'image';

  /// For user provided image URL.
  final TextEditingController urlController = TextEditingController();

  @override
  void onInit() {
    registerImageElement();
    super.onInit();
  }

  /// Loads image from URL into img html element.
  void loadImage({required String url, required String elementId}) async {
    imageUrl = url;
    // Using HTML-element <img> for displaying
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      final imgElement =
          html.document.getElementById(elementId) as html.HTMLImageElement?;
      if (imgElement != null) {
        imgElement.src = imageUrl!;
      }
      update();
    }
  }

  /// Registers IMG html tag factory.
  void registerImageElement() {
    // Setting properties for <img>
    final imgElement = html.HTMLImageElement();
    imgElement.id = imageElementId;
    imgElement.style.width = '100%';
    imgElement.style.height = '100%';
    imgElement.style.objectFit = 'contain';
    imgElement.style.borderRadius = '12px';

    // registering view factory
    ui.platformViewRegistry.registerViewFactory(
      'image-view',
      (int viewId) => imgElement,
    );
  }

  /// Sets a specific fullscreen mode.
  void setFullScreen(bool fullScreenSet) {
    FullScreen.toggleFullscreen(fullScreenSet);
    closeMenu();
  }

  /// Toggles fullscreen mode.
  void toggleFullscreen() {
    FullScreen.isFullscreen
        ? FullScreen.toggleFullscreen(false)
        : FullScreen.toggleFullscreen(true);

  }

  /// Toggles bottom menu displaying.
  void toggleMenu() {
    isMenuVisible = !isMenuVisible;
    update();
  }

  /// Closes bottom menu.
  void closeMenu() {
    isMenuVisible = false;
    update();
  }

  /// Sets image to the center of screen from user-provided url.
  void setImage(String imgURL) {
    //TODO url validation
    //...

    //loading image to the html element
    loadImage(url: imgURL, elementId: imageElementId);
  }
}
