import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'coin_data.dart';
import 'dart:io';
import 'dart:convert';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}
class _PriceScreenState extends State<PriceScreen> {
  // String selectedCurrency = currenciesList.first; //for DropDownButton
  //${currenciesList.first}



  var selectedCurrency = 9;

var Url;

  var currentVale=0.0;
  late var currentBitcoin; 
  late var currentCurrency;




  

  Future<Response> fetchData() async {
    Response bitcoin_data = await get(Url);
    return bitcoin_data;
  }

  double _kItemExtent = 32.0;

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
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
                  // '1 $currentBitcoin = $currentVale $currentCurrency',
                  // "1 "
                  '1 ${cryptoList[0]} = ${currentVale.toInt()} ${currenciesList[selectedCurrency]}',
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
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => _showDialog(
                CupertinoPicker(
                  magnification: 1.22,
                  squeeze: 1.2,
                  useMagnifier: true,
                  itemExtent: _kItemExtent,


                  scrollController: FixedExtentScrollController(
                    initialItem: selectedCurrency,
                  ),
                  // This is called when selected item is changed.
                  onSelectedItemChanged: (int selectedItem) {
                    setState(()  async{
                      selectedCurrency = selectedItem;
                        Url = Uri.parse('https://rest.coinapi.io/v1/exchangerate/BTC/${currenciesList[selectedCurrency]}?apikey=7D92C932-CCE9-4431-9069-53BFAD47D403');
                      Response output = await fetchData();
                      var responseData = output.body;
                      // print(responseData);
                      currentBitcoin =jsonDecode(responseData)['asset_id_base'];
                      currentCurrency =jsonDecode(responseData)['asset_id_quote'];
                      currentVale = jsonDecode(responseData)['rate'];
                      print(currentVale);
                      //to UPDATE THE value after fetch
                      setState(() {
                        currentVale;
                      });
                      
                    });
                  },
                  children:
                      List<Widget>.generate(currenciesList.length, (int index) {
                    return Center(child: Text(currenciesList[index]));
                  }),
                ),
              ),
        
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


