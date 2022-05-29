import 'package:flutter/material.dart';
import 'package:kit_utilities/widgets/pages/widgets_page.dart';
import 'package:kit_utilities/widgets/pages/utilitiesPage/utilities_page.dart';

class PageSelector extends StatelessWidget {
  const PageSelector({Key? key}) : super(key: key);
  static const pages = [WidgetsPage(), UtilitiesPage()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Builder(
        builder: (BuildContext context) => Stack(
          children: const [
            TabBarView(
              children: pages,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: TabPageSelector(
                indicatorSize: 8.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
