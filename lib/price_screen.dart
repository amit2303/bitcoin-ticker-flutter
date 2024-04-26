import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'dart:io';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  // String selectedCurrency = currenciesList.first; //for DropDownButton
  var selectedCurrency =0;
  double _kItemExtent = 32.0;

 
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
        backgroundColor: const Color.fromARGB(255, 2, 49, 71),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: const Color.fromARGB(255, 2, 49, 71),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 200.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: const Color.fromARGB(255, 2, 49, 71),

            //for android


            // child: DropdownButton<String>(
            //   value: selectedCurrency,
            //   // icon: const Icon(Icons.arrow_downward),
            //   // elevation: 16,
            //   // style: const TextStyle(color: Colors.deepPurple),
            //   // underline: Container(
            //   //   height: 2,
            //   //   color: Colors.deepPurpleAccent,
            //   // ),
            //   onChanged: (String? value) {
            //     // This is called when the user selects an item.
            //     setState(() {
            //       selectedCurrency = value!;
            //     });
            //   },
            //   items:
            //       currenciesList.map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            // ),




              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () => _showDialog(
                  CupertinoPicker(
                    magnification: 1.22,
                    squeeze: 1.2,
                    useMagnifier: true,
                    itemExtent: _kItemExtent,
                    // This sets the initial item.
                    scrollController: FixedExtentScrollController(
                      initialItem: selectedCurrency,
                    ),
                    // This is called when selected item is changed.
                    onSelectedItemChanged: (int selectedItem) {
                      setState(() {
                        selectedCurrency = selectedItem;
                      });
                    },
                    children:
                        List<Widget>.generate(currenciesList.length, (int index) {
                      return Center(child: Text(currenciesList[index]));
                    }),
                  ),
                ),
                // This displays the selected fruit name.
                child: Text(
                  currenciesList[selectedCurrency],
                  style: const TextStyle(
                    fontSize: 22.0,
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}







