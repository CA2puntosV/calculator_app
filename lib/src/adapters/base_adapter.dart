import 'package:flutter/material.dart';

abstract class BaseAdapter {
  const BaseAdapter();

  // Mobile portrait
  Widget buildPortrait(BuildContext context);

  // Mobile Landscape
  Widget buildLandscape(BuildContext context);

  static ViewPortType viewPortType(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    ViewPortType result;

    // Mobile portrait
    if (orientation == Orientation.portrait) {
      result = ViewPortType.Portrait;
    }
    // Mobile Landscape
    else {
      result = ViewPortType.Landscape;
    }

    return result;
  }

  Widget build(BuildContext context) {
    Widget result;
    var viewPortType = BaseAdapter.viewPortType(context);

    switch (viewPortType) {
      case ViewPortType.Portrait:
        result = buildPortrait(context);
        break;
      case ViewPortType.Landscape:
        result = buildLandscape(context);
        break;
      default:
        throw UnimplementedError();
    }

    return result;
  }
}

enum ViewPortType {
  Portrait,
  Landscape,
}
