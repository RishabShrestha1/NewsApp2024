import 'package:flutter/material.dart';
import 'package:newsapp2024/resources/app_color.dart';
import 'package:newsapp2024/resources/dimensions.dart';

class CategoryTab extends StatefulWidget {
  // final TabController tabController;

  const CategoryTab({
    super.key,
    // required this.tabController,
  });

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  void initState() {
    super.initState();
    tabController = TabController(length: 8, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      isScrollable: true,
      labelPadding: EdgeInsets.only(right: deviceWidth * 0.045),
      labelStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColor.selectedtextColor,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColor.unselectedtextColor,
      ),
      tabAlignment: TabAlignment.start,
      dividerColor: Colors.transparent,
      indicatorColor: AppColor.primaryColor,
      indicatorSize: TabBarIndicatorSize.label,
      automaticIndicatorColorAdjustment: true,
      tabs: const [
        Tab(
          text: 'All',
        ),
        Tab(
          child: Text('Sports'),
        ),
        Tab(
          child: Text('Politics'),
        ),
        Tab(
          child: Text('Buisness'),
        ),
        Tab(
          child: Text('Health'),
        ),
        Tab(
          child: Text('Travel'),
        ),
        Tab(
          child: Text('Science'),
        ),
        Tab(
          child: Text('Fashion'),
        )
      ],
    );
  }
}
