import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/Featuer/Home/Widgets/tabs.dart';
import 'package:taskati/core/widgets/task_card.dart';

class TabTasks extends StatefulWidget {
  const TabTasks({super.key});
  @override
  State<TabTasks> createState() => _TabTasksState();
}

class _TabTasksState extends State<TabTasks> {
  // bool _isSelcted = false;
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TabBar(
            dividerColor: Colors.transparent,
            onTap: (index) {
              setState(() {
                _index = index;
              });
            },
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(),
            labelPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
            tabs: [
              Tabs(index: _index, titel: 'All', select: 0),
              Tabs(index: _index, titel: 'In Progress', select: 1),
              Tabs(index: _index, titel: 'Completed', select: 2),
            ],
          ),
          Gap(30),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return TaskCard(
                      titel: 'Market Research',
                      description: 'Grocery shopping app design Grocery shopping app design',
                      startTime: '10:00 AM',
                      endTime: '12:00 AM',
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Gap(15);
                  },
                  itemCount: 3,
                ),
                ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return TaskCard(
                      titel: 'Market Research',
                      description: 'Grocery shopping app design Grocery shopping app design Grocery shopping app design Grocery shoppijkjjjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkj',
                      startTime: '10:00 AM',
                      endTime: '12:00 AM',
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Gap(15);
                  },
                  itemCount: 3,
                ),
                ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return TaskCard(
                      titel: 'Market Research Market ResearchMarketnmnmnmnmnmnmnmnmnnmnmnmnnmnmnm...',
                      description: 'Grocery shopping app design Grocery shopping app design',
                      startTime: '10:00 AM',
                      endTime: '12:00 AM',
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Gap(15);
                  },
                  itemCount: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
