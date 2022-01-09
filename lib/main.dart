import 'package:flutter/material.dart';
import 'package:game_tv/services/api/service_manager.dart';
import 'package:game_tv/services/config/flavor_config.dart';

import 'base_app.dart';

void main() {
  FlavorConfig(
      flavor: Flavor.production,
      color: Colors.deepPurpleAccent,
      values: FlavorValues(
        baseUrl: '',
      ));
  ServiceManager.init(
      baseUrl: FlavorConfig.instance.flavorValues.baseUrl,
      isDebug: FlavorConfig.instance.isDebug);
  baseAppSetup();
}
