import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fsm_flutter/data/entity/work_order_entity.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

import '../../core/components/no_data_widget.dart';
import '../../core/themes/app_theme.dart';
import 'cubit/fsm_work_orders_cubit.dart';
import 'fsm_dashboard_drawer.dart';
import 'job_list_widget.dart';

class FSMDashboardPage extends StatefulWidget {
  const FSMDashboardPage(
      {super.key, this.initialStatus = WorkOrderStatus.assigned});
  final WorkOrderStatus initialStatus;

  @override
  State<FSMDashboardPage> createState() => _FSMDashboardPageState();
}

class _FSMDashboardPageState extends State<FSMDashboardPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  late TabController _tabController;
  final int _page = 1;
  final int _limit = 10;
  String order = "dec";

  int get initialTabIndex {
    switch (widget.initialStatus) {
      case WorkOrderStatus.assigned:
        return 0;
      case WorkOrderStatus.inProgress:
        return 1;
      case WorkOrderStatus.paused:
        return 2;
      case WorkOrderStatus.completed:
        return 3;
      default:
        return 0; // Default to assigned if status is unknown
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 4, vsync: this, initialIndex: initialTabIndex);
    _tabController.addListener(_onTabChanged);
    context
        .read<FsmWorkOrdersCubit>()
        .workOrder(_page, _limit, widget.initialStatus);
    Future.delayed(Duration.zero, () {
      // Ensure the initial tab is set correctly after the first build
      // _tabController.index = initialTabIndex;
      _refreshData(widget.initialStatus);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    if (!_tabController.indexIsChanging) {
      WorkOrderStatus newStatus;
      switch (_tabController.index) {
        case 0:
          newStatus = WorkOrderStatus.assigned;
          break;
        case 1:
          newStatus = WorkOrderStatus.inProgress;
          break;
        case 2:
          newStatus = WorkOrderStatus.paused;
          break;
        case 3:
          newStatus = WorkOrderStatus.completed;
          break;
        default:
          newStatus = WorkOrderStatus.assigned;
      }
      context.read<FsmWorkOrdersCubit>().workOrder(_page, _limit, newStatus);
    }
  }

  void sortData() {
    setState(() {
      order = order == 'asc' ? 'dec' : 'asc';
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Job List"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(1.00, 0.00),
                end: Alignment(-1, 0),
                colors: [AppColors.initialColor, AppColors.finalColor],
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                order == 'asc' ? Icons.arrow_upward : Icons.arrow_downward,
                color: AppColors.whiteColor,
              ),
              onPressed: sortData,
              tooltip: 'Sort ${order == 'asc' ? 'Ascending' : 'Descending'}',
            ),
          ],
        ),
        drawer: FSMDashboardDrawer(
          scaffoldKey: _scaffoldKey,
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(1.00, 0.00),
                  end: Alignment(-1, 0),
                  colors: [AppColors.initialColor, AppColors.finalColor],
                ),
              ),
              child: Column(
                children: [
                  // Stats Cards - Wrapped in a BlocBuilder for targeted updates
                  BlocBuilder<FsmWorkOrdersCubit, FsmWorkOrdersState>(
                    buildWhen: (previous, current) {
                      if (current is FsmWorkOrdersLoading &&
                          previous is! FsmWorkOrdersLoading) return true;
                      if (current is FsmWorkOrdersSuccess &&
                          previous is FsmWorkOrdersSuccess) {
                        bool statsChanged = false;
                        for (var statusValue in WorkOrderStatus.values) {
                          if ((previous.workOrderMap[statusValue]?.length ??
                                  0) !=
                              (current.workOrderMap[statusValue]?.length ??
                                  0)) {
                            statsChanged = true;
                            break;
                          }
                        }
                        return statsChanged;
                      }
                      return previous.runtimeType != current.runtimeType;
                    },
                    builder: (context, state) {
                      if (state is FsmWorkOrdersSuccess) {
                        return Row(
                          children: [
                            _buildStatsCard(
                                "Assigned",
                                state.workOrderMap[WorkOrderStatus.assigned]
                                        ?.length
                                        .toString() ??
                                    "0"),
                            _buildStatsCard(
                                "In Progress",
                                state.workOrderMap[WorkOrderStatus.inProgress]
                                        ?.length
                                        .toString() ??
                                    "0"),
                            _buildStatsCard(
                                "Paused",
                                state.workOrderMap[WorkOrderStatus.paused]
                                        ?.length
                                        .toString() ??
                                    "0"),
                            _buildStatsCard(
                                "Closed",
                                state.workOrderMap[WorkOrderStatus.completed]
                                        ?.length
                                        .toString() ??
                                    "0"),
                          ],
                        );
                      }
                      // Placeholder for stats during loading or other states
                      return Row(
                        children: [
                          _buildStatsCard("Assigned", "-"),
                          _buildStatsCard("In Progress", "-"),
                          _buildStatsCard("Paused", "-"),
                          _buildStatsCard("Closed", "-"),
                        ],
                      );
                    },
                  ),
                  // TabBar - Structure is static, not dependent on FsmWorkOrdersState for rebuild
                  TabBar(
                    controller: _tabController,
                    unselectedLabelStyle: TextStyle(color: Colors.white70),
                    labelColor: AppColors.whiteColor,
                    indicatorColor: AppColors.whiteColor,
                    labelStyle: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.whiteColor,
                    ),
                    tabs: <Widget>[
                      Tab(
                        text: "Assigned",
                        icon: Icon(Icons.not_started_outlined),
                      ),
                      Tab(
                        text: "In Progress",
                        icon: Icon(Icons.autorenew_rounded),
                      ),
                      Tab(
                        text: "Paused",
                        icon: Icon(Icons.pause_rounded),
                      ),
                      Tab(
                        text: "Closed",
                        icon: Icon(Icons.check_circle_outline),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<FsmWorkOrdersCubit, FsmWorkOrdersState>(
                builder: (context, state) {
                  if (state is FsmWorkOrdersLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is FsmWorkOrdersFailure) {
                    return Center(child: Text(state.error));
                  } else if (state is FsmWorkOrdersSuccess) {
                    return TabBarView(
                      controller: _tabController,
                      children: [
                        _buildTabContent(WorkOrderStatus.assigned, state),
                        _buildTabContent(WorkOrderStatus.inProgress, state),
                        _buildTabContent(WorkOrderStatus.paused, state),
                        _buildTabContent(WorkOrderStatus.completed, state),
                      ],
                    );
                  }
                  // Default/Initial state (e.g., before first load completes)
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsCard(String title, String value) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Container(
        width: 0.21.sw,
        padding: const EdgeInsets.all(8.0).r,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              value,
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  // Build content for the specific tab
  Widget _buildTabContent(WorkOrderStatus status, FsmWorkOrdersSuccess state) {
    final workOrders = state.workOrderMap[status] ?? [];

    if (workOrders.isEmpty) {
      return RefreshIndicator(
        onRefresh: () => _refreshData(status),
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Center(
                child: NoDataWidget(
                  title: status.toString().split('.').last,
                  description: 'There are no tickets for this status',
                ),
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => _refreshData(status),
      child: _buildJobListWidget(status, workOrders),
    );
  }

  Future<void> _refreshData(WorkOrderStatus status) async {
    try {
      await context
          .read<FsmWorkOrdersCubit>()
          .refreshWorkOrders(_page, _limit, status);
    } catch (e) {
      if (mounted) {
        // Good practice to check if widget is still mounted
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to refresh: ${e.toString()}'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  Widget _buildJobListWidget(
      WorkOrderStatus status, List<WorkOrderEntity> workOrders) {
    return InfiniteList(
      itemCount: workOrders.length,
      onFetchData: () => {}, // Data is loaded by tab change, not scroll
      itemBuilder: (context, index) {
        int displayIndex;
        if (order == 'dec') {
          displayIndex = workOrders.length - 1 - index;
        } else {
          displayIndex = index;
        }

        final workOrder = workOrders[displayIndex];
        return JobListWidget(workOrder: workOrder, status: status);
      },
    );
  }
}
