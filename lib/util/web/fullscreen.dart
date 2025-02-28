// Copyright © 2022-2025 IT ENGINEERING MANAGEMENT INC,
//                       <https://github.com/team113>
// TODO learn about rights for using part of code


import 'dart:js_interop';


///Util to manipulate full screen modes using JS

//methods for enabling full screen in different browsers

@JS('document.documentElement.requestFullscreen')
external void requestFullscreen();

@JS('document.documentElement.requestFullscreen')
external JSFunction? requestFullscreenClosure;

@JS('document.documentElement.mozRequestFullScreen')
external void mozRequestFullScreen();

@JS('document.documentElement.mozRequestFullScreen')
external JSFunction? mozRequestFullScreenClosure;

@JS('document.documentElement.webkitRequestFullScreen')
external void webkitRequestFullScreen();

@JS('document.documentElement.webkitRequestFullScreen')
external JSFunction? webkitRequestFullScreenClosure;

@JS('document.documentElement.msRequestFullscreen')
external void msRequestFullscreen();

@JS('document.documentElement.msRequestFullscreen')
external JSFunction? msRequestFullscreenClosure;

//methods for disabling full screen in different browsers

@JS('document.exitFullscreen')
external void exitFullscreen();

@JS('document.exitFullscreen')
external JSFunction? exitFullscreenClosure;

@JS('document.mozCancelFullScreen')
external void mozCancelFullScreen();

@JS('document.mozCancelFullScreen')
external JSFunction? mozCancelFullScreenClosure;

@JS('document.webkitCancelFullScreen')
external void webkitCancelFullScreen();

@JS('document.webkitCancelFullScreen')
external JSFunction? webkitCancelFullScreenClosure;

@JS('document.msExitFullscreen')
external void msExitFullscreen();

//methods for querying full screen state

@JS('document.msExitFullscreen')
external JSFunction? msExitFullscreenClosure;

@JS('document.fullscreenElement')
external JSAny? fullscreenElement;

@JS('document.webkitFullscreenElement')
external JSAny? webkitFullscreenElement;

@JS('document.msFullscreenElement')
external JSAny? msFullscreenElement;


/// Helper for manipulating full screen mode in different platforms
///
/// currently support only web implementation
class FullScreen {
  /// Indicates whether device's browser is in fullscreen mode or not.
  static bool get isFullscreen {
    return (fullscreenElement != null ||
        webkitFullscreenElement != null ||
        msFullscreenElement != null);
  }

  ///Toggles fullscreen to the desired state
  static bool toggleFullscreen(bool enable) {
    try {
      if (enable) {
        if (requestFullscreenClosure != null) {
          requestFullscreen();
        } else if (mozRequestFullScreenClosure != null) {
          mozRequestFullScreen();
        } else if (webkitRequestFullScreenClosure != null) {
          webkitRequestFullScreen();
        } else if (msRequestFullscreenClosure != null) {
          msRequestFullscreen();
        }
      } else {
        if (exitFullscreenClosure != null) {
          exitFullscreen();
        } else if (mozCancelFullScreenClosure != null) {
          mozCancelFullScreen();
        } else if (webkitCancelFullScreenClosure != null) {
          webkitCancelFullScreen();
        } else if (msExitFullscreenClosure != null) {
          msExitFullscreen();
        }
      }
    } catch (e) {

      return false;
    }
    return enable;
  }
}
