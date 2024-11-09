import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SectionChartUtils {
  static PieChartSectionData hit({required double value}) {
    return _section(value: value, cor: Colors.green.shade300);
  }

  static PieChartSectionData dismiss({required double value}) {
    return _section(value: value, cor: Colors.red.shade300);
  }

  static PieChartSectionData aborted({required double value}) {
    return _section(value: value, cor: Colors.grey.shade300);
  }

  static PieChartSectionData _section(
      {required double value, required Color cor}) {
    return PieChartSectionData(
      color: cor,
      value: value,
      title: value.toString(),
      borderSide: const BorderSide(
        width: 2,
        style: BorderStyle.solid,
        color: Colors.white,
      ),
      titleStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        // color: Colors.white,
        // shadows: [
        //   Shadow(
        //     color: Colors.black.withAlpha(125),
        //     offset: const Offset(0, 2),
        //   )
        // ],
      ),
    );
  }
}

    

// class PiChartSectionClass extends PieChartSectionData {
//   final double valueSection;
//   final Color? cor;

//   PiChartSectionClass({
//     super.value,
//     super.color,
//     super.gradient,
//     super.radius,
//     super.showTitle,
//     super.titleStyle,
//     super.title,
//     super.borderSide,
//     super.badgeWidget,
//     super.titlePositionPercentageOffset,
//     super.badgePositionPercentageOffset,
//     required this.valueSection,
//     this.cor,
//   });

//   PiChartSectionClass.hit({required double value})
//       : valueSection = value,
//         cor = Colors.green.shade200 {
//     PiChartSectionClass.section(value, cor);
//   }

//   PiChartSectionClass.dismiss({required double value})
//       : valueSection = value,
//         cor = Colors.red.shade200 {
//     PiChartSectionClass.section(value, cor);
//   }

//   PiChartSectionClass.aborted({required double value})
//       : valueSection = value,
//         cor = Colors.grey.shade200 {
//     PiChartSectionClass.section(value, cor);
//   }

//   PiChartSectionClass.section(this.valueSection, this.cor)
//       : super(
//           color: cor,
//           value: valueSection,
//           title: valueSection.toString(),
//           borderSide: const BorderSide(
//             width: 4,
//             style: BorderStyle.solid,
//             color: Colors.white,
//           ),
//           titleStyle: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//             shadows: [
//               Shadow(
//                 color: Colors.black.withAlpha(125),
//                 offset: const Offset(0, 2),
//               )
//             ],
//           ),
//         );
// }
