import 'package:flutter/material.dart';
import 'package:flutter_receipt_app/src/assets/fonts.dart';
import 'package:flutter_receipt_app/src/palette.dart';

class AddDocPage extends StatelessWidget {
  static const routeName = '/addDoc';

  const AddDocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New document'),
      ),
      body: ListView(
        children: [
          Card(
            margin: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 18.0),
                  const Text(
                    'Store Name',
                    style: TextStyle(
                      fontFamily: Fonts.courierPrime,
                      fontSize: 28.0,
                    ),
                  ),
                  const SizedBox(height: 18.0),
                  SizedBox(
                    width: double.infinity,
                    child: DataTable(
                      headingTextStyle:
                          Theme.of(context).textTheme.caption!.copyWith(
                                fontFamily: Fonts.courierPrime,
                                fontSize: 11.0,
                                color: Palette.eerieBlack,
                              ),
                      dataTextStyle:
                          Theme.of(context).textTheme.caption!.copyWith(
                                color: Palette.eerieBlack,
                                fontFamily: Fonts.courierPrime,
                              ),
                      horizontalMargin: 0.0,
                      columnSpacing: 2.0,
                      columns: const <DataColumn>[
                        DataColumn(label: Text('No')),
                        DataColumn(label: Text('Item')),
                        DataColumn(label: Text('Price')),
                        DataColumn(label: Text('Qty.')),
                        DataColumn(label: Text('Total')),
                      ],
                      rows: const <DataRow>[
                        DataRow(cells: <DataCell>[
                          DataCell(Text('1')),
                          DataCell(Text('Laundry 3kg')),
                          DataCell(Text('1000')),
                          DataCell(Text('2')),
                          DataCell(Text('12000')),
                        ]),
                        DataRow(cells: <DataCell>[
                          DataCell(Text('2')),
                          DataCell(Text('Laundry 3kg')),
                          DataCell(Text('1000')),
                          DataCell(Text('2')),
                          DataCell(Text('12000')),
                        ]),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
