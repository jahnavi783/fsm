import 'package:flutter/material.dart';
import 'package:fsm_flutter/presentation/core/components/gradient_appbar_widget.dart';

class PartsManagementScreen extends StatefulWidget {
  const PartsManagementScreen({super.key});

  @override
  State<PartsManagementScreen> createState() => _PartsManagementScreenState();
}

class _PartsManagementScreenState extends State<PartsManagementScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text("Parts Management"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Total Items : 05",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal),
                ),
                Text(
                  "Re-order Items : 69",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal),
                ),
              ],
            ),
            SizedBox(height: 16),
            DefaultTabController(
              length: 2,
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.green,
                indicatorWeight: 3,
                isScrollable: true,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black54,
                tabs: [
                  Tab(text: "Available"),
                  Tab(text: "Re-Order"),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildItemsTable(),
                  Center(child: Text("Re-Order Items")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemsTable() {
    List<ItemData> items = [
      ItemData("Wrench", "Low Stock", 5, isLowStock: true),
      ItemData("Electric Tape", "Low Stock", 4, isLowStock: true),
      ItemData("Machine Render", "In-Stock", 12),
      ItemData("Drilling Saw", "In-Stock", 21),
      ItemData("Screws Big", "In-Stock", 12),
    ];

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border(
              bottom: BorderSide(color: Colors.grey[300]!),
            ),
          ),
          child: Table(
            columnWidths: const {
              0: FlexColumnWidth(2), // Item Name takes 2/4 of the space
              1: FlexColumnWidth(1), // Status takes 1/4 of the space
              2: FlexColumnWidth(1), // Quantity takes 1/4 of the space
            },
            children: [
              TableRow(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Item Name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Status",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Qty",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(2), // Item Name takes 2/4 of the space
                  1: FlexColumnWidth(1), // Status takes 1/4 of the space
                  2: FlexColumnWidth(1), // Quantity takes 1/4 of the space
                },
                border: TableBorder(
                  horizontalInside: BorderSide(
                    color: Colors.grey[300]!,
                    width: 1,
                  ),
                ),
                children: items.map((item) => _buildTableRow(item)).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  TableRow _buildTableRow(ItemData item) {
    return TableRow(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            item.name,
            style: TextStyle(fontSize: 14),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            item.status,
            style: TextStyle(
              fontSize: 14,
              color: item.isLowStock ? Colors.red : Colors.black,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            item.quantity.toString().padLeft(2, '0'),
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}

class ItemData {
  final String name;
  final String status;
  final int quantity;
  final bool isLowStock;

  ItemData(this.name, this.status, this.quantity, {this.isLowStock = false});
}
