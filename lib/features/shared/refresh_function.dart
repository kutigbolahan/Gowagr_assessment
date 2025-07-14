
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gowagr_assessment/core/constants/colors.dart';
import 'package:gowagr_assessment/features/Dashboard/domain/providers/provider/dashboard_providers.dart';
import 'package:gowagr_assessment/features/shared/gowagr_text_widget.dart';

final genericFunctions = GenericFunctions();

class GenericFunctions {
  reFreshAllEndpoints(WidgetRef ref, BuildContext context) {
    ref
        .watch(gowagrProvider.notifier)
        .gowagr(
          ref: ref,
          context: context,
          keyword: '',
          trending: true,
          size: 10,
          page: 1,
          category: '',
        );
  }

  showADialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: GowagrTextWidget(
            text: 'Please Check your internet connection',
            color: appColors.grey7387A6,
            fontWeight: FontWeight.w500,
            fontsize: 12,
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
