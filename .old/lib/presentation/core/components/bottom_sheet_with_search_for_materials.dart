import 'package:flutter/material.dart';
import 'package:fsm_flutter/data/entity/spare_part.dart';
import 'package:fsm_flutter/presentation/core/components/gradient_elevated_button.dart';

class SelectionBottomSheetForMaterials extends StatefulWidget {
  final List<SparePartEntity> items;
  final List<SparePartEntity> selectedItems;
  final Function(List<SparePartEntity>) onItemSelected;

  const SelectionBottomSheetForMaterials({
    super.key,
    required this.items,
    required this.selectedItems,
    required this.onItemSelected,
  });

  @override
  SelectionBottomSheetForMaterialsState createState() =>
      SelectionBottomSheetForMaterialsState();
}

class SelectionBottomSheetForMaterialsState
    extends State<SelectionBottomSheetForMaterials> {
  List<SparePartEntity> filteredItems = [];
  List<SparePartEntity> selectedItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = widget.items;
    selectedItems = List.from(widget.selectedItems);
  }

  void _filterItems(String query) {
    setState(() {
      filteredItems = widget.items
          .where((item) =>
              item.partName.toLowerCase().contains(query.toLowerCase()) ||
              item.partNumber.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _onItemSelected(SparePartEntity item) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Select all the Materials",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          TextFormField(
            onChanged: _filterItems,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Search by Materials or Part Number',
              hintText: 'Search by',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: filteredItems.isEmpty
                ? Center(
                    child: Text(
                      'No data available for the searched part',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : ListView.separated(
                    padding: EdgeInsets.only(bottom: 8),
                    itemCount: filteredItems.length,
                    separatorBuilder: (context, index) => SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      final isSelected = selectedItems.contains(item);
                      return Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => _onItemSelected(item),
                          borderRadius: BorderRadius.circular(8),
                          child: Card(
                            elevation: 2,
                            color: isSelected ? Colors.green : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(6),
                              child: Row(
                                children: [
                                  Icon(
                                    isSelected
                                        ? Icons.check_circle
                                        : Icons.circle_outlined,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                    size: 24,
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.partName,
                                          style: TextStyle(
                                            color: isSelected
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          item.partNumber,
                                          style: TextStyle(
                                            color: isSelected
                                                ? Colors.white.withOpacity(0.8)
                                                : Colors.black54,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          SizedBox(height: 16),
          GradientElevatedButton(
            onPressed: () {
              widget.onItemSelected(selectedItems);
            },
            child: Text(
              'Save Selections',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
        ],
      ),
    );
  }
}
