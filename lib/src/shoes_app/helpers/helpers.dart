import 'package:flutter/services.dart' as services;

void setLightContent() {
  services.SystemChrome.setSystemUIOverlayStyle(
    services.SystemUiOverlayStyle.light,
  );
}

void setDarkContent() {
  services.SystemChrome.setSystemUIOverlayStyle(
    services.SystemUiOverlayStyle.dark,
  );
}
