import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';

class SliderController extends GetxController {
  RxDouble km = 1.0.obs;
  RxDouble val1 = 1.0.obs;
  RxDouble val2 = 5.0.obs;

  UpdateSlider(double val) {
    km.value = val;
  }

  UpdateRangeSlider(RangeValues values) {
    val1.value = values.start;
    val2.value = values.end;
  }
}
