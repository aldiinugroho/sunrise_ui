// Widgetbook file: widgetbook.dart
import 'package:flutter/material.dart';
import 'package:sunrise_ui/src/components/srfield/enumsrfield.dart';
import 'package:sunrise_ui/sunrise_ui.dart';
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
          WidgetbookUseCase.child(name: 'SRField Text', child: const SRField()),
          WidgetbookUseCase.child(
              name: 'SRField Calendar',
              child: const SRField(
                srFieldType: EnumSRField.calendar,
              )),
          WidgetbookUseCase.child(
              name: 'SRField Calendar Range',
              child: const SRField(
                srFieldType: EnumSRField.calendarrange,
              ))
        ])
      ],
    );
  }
}
