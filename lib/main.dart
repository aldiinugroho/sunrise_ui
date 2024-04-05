// Widgetbook file: widgetbook.dart
import 'package:flutter/material.dart';
import 'package:sunrise_ui/src/components/srtextfield/main.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(const HotReload());
}

class HotReload extends StatelessWidget {
  const HotReload({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: const [],
      directories: [
        WidgetbookComponent(name: 'Components', useCases: [
          WidgetbookUseCase.child(
              name: 'SRTextField', child: const SRTextField())
        ])
      ],
    );
  }
}
