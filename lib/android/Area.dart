import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class areachart extends StatelessWidget {
   
  const areachart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
            ChartData(2001, 20),
            ChartData(2005, 10),
            ChartData(2010, 17),
             ChartData(2015, 13),
            ChartData(2020, 32),
           
        ];
         Color color7 = Color(0xFF6BB5FA); // Blue color
    Color color8 = Color(0xFFFFFFFF);
     Color color = Color.fromARGB(255, 51, 114, 173);
    Color? mixedColor = Color.lerp(color7, color8, 0.5);
    return  Container(
              width: 180,
              height: 140,
                child: SfCartesianChart(
                primaryYAxis: NumericAxis(isVisible: false,),
                     primaryXAxis: NumericAxis(
                        // X axis will be opposed
                    isVisible: false,
                  
                    ),
                  legend: Legend(isResponsive: false,isVisible: false),
                    series: <CartesianSeries>[
                        // Renders area chart
                        AreaSeries<ChartData, int>(
                            dataSource: chartData,
                            
                              color:mixedColor,
                            borderDrawMode: BorderDrawMode.excludeBottom,
                            borderColor: color,
                            
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y
                        )
                    ]
                )
            
        );
  }
}
 class ChartData {
        ChartData(this.x, this.y);
        final int x;
        final double y;
    }