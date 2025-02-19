import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:html' as html;
import 'dart:ui_web' as ui;
import 'dart:js' as js;
import 'dart:js_util' as js_util;

/// Controller for managing states of home screen view.
///
/// It involves refreshing the entire screen.



class HomeController extends GetxController {

  /// Image URL that will be displayed.
  String? imageUrl;

  /// Whether Fullscreen mode choosen.
  bool isFullscreen = false;

  ///Whether bottom right menu is showed.
  bool isMenuVisible = false;

  ///Image element id
  final imageElementId='image';

  /// For user provided image URL.
  final TextEditingController urlController = TextEditingController();


  /// Loads image from URL into img html element.
  void loadImage({required String url, required String elementId}) async {
    imageUrl = url;
    // Using HTML-element <img> for displaying
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      final imgElement = html.document.getElementById(elementId) as html.ImageElement?;
      if (imgElement != null) {
        imgElement.src = imageUrl!;
      }
      update();
    }
  }

  /// Registers IMG html tag factory.

  void registerImageElement() {
    // Setting properties for <img>
    final imgElement = html.ImageElement();
    imgElement.id = imageElementId;
    imgElement.style.width = '100%';
    imgElement.style.height = '100%';
    imgElement.style.objectFit = 'cover';
    imgElement.style.borderRadius = '12px';

    // registering view factory
    ui.platformViewRegistry.registerViewFactory(
      'image-view',
      (int viewId) => imgElement,
    );
  }

  /// Sets a specific Fullscreen mode.
  void setFullScreen(bool fullScreenSet) {
    if (fullScreenSet && !isFullscreen) {
      toggleFullscreen();
    }
    if (!fullScreenSet && isFullscreen) {
      toggleFullscreen();
    }
    closeMenu();
  }

  /// Toggles fullsreen mode.
  void toggleFullscreen() {
    if (isFullscreen) {
      // exit fullscreen
      js_util.callMethod(js.context['document'], ['exitFullscreen'], []);
    } else {
      // enter fullscreen
      js_util.callMethod(html.document.body!, ['requestFullscreen'], []);
    }
    isFullscreen = !isFullscreen;
    update();
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
  void setImage(TextEditingController textController) {
    //TODO url validation
    //...not asked

    //loading image to the html element
    loadImage(url: textController.text, elementId: imageElementId);
  }
}
