import 'package:flutter/material.dart';
import '../feauters/forms/presentation_layer/pages/add_form.dart';
import '../feauters/forms/presentation_layer/pages/edit_form.dart';
import '../feauters/forms/presentation_layer/pages/get_form.dart';
import '../feauters/forms/presentation_layer/pages/home.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute( HomePage());

      case '/GetForms':
        return _materialRoute(GetForms());

      case '/AddForm':
      return _materialRoute(AddForm());

      case '/EditForm':
      return _materialRoute(EditForm());

      default:
        return _materialRoute( HomePage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}