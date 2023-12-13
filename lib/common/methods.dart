

import 'package:clean_architecture/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackbar(
    String message, {
      bool isError = true,
    }) {
  Get.snackbar(
    "",
    "",
    backgroundColor: isError
        ? Get.theme.colorScheme.errorContainer
        : Get.theme.colorScheme.primaryContainer,
    icon: Icon(
      isError ? Icons.close_rounded : Icons.check_circle_rounded,
      color:
      isError ? Get.theme.colorScheme.error : Get.theme.colorScheme.primary,
    ),
    titleText: Text(
      isError ? "Error" : "Success",
      style: baseTextStyle().copyWith(
        color: isError
            ? Get.theme.colorScheme.error
            : Get.theme.colorScheme.primary,
        fontWeight: semiBold,
      ),
    ),
    messageText: Text(
      message,
      style: baseTextStyle().copyWith(
        color: isError
            ? Get.theme.colorScheme.error
            : Get.theme.colorScheme.primary,
      ),
    ),
  );
}