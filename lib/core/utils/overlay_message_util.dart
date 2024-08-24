import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

abstract class OverlayMessageUtil {
  static showSuccessOverlayMessage(String message) {
    showOverlayNotification(
      (context) {
        return SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        );
      },
      duration: const Duration(seconds: 2),
    );
  }

  static showErrorOverlayMessage(String message) {
    showOverlayNotification(
      (context) {
        return SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        );
      },
      duration: const Duration(seconds: 2),
    );
  }
}
