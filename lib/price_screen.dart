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
  var currentVale_2=0.0;
  var currentVale_3=0.0;






  

  Future<Response> fetchData(var Url) async {
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

                  '1 ${cryptoList[1]} = ${currentVale_2.toInt()} ${currenciesList[selectedCurrency]}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
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
     
                  '1 ${cryptoList[2]} = ${currentVale_3.toInt()} ${currenciesList[selectedCurrency]}',
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
                      
                        var Url_1 = Uri.parse('https://rest.coinapi.io/v1/exchangerate/BTC/${currenciesList[selectedCurrency]}?apikey=7D92C932-CCE9-4431-9069-53BFAD47D403');
                        Response output = await fetchData(Url_1);
                        var responseData = output.body;
                        currentVale = jsonDecode(responseData)['rate'];

                        var Url_2 = Uri.parse('https://rest.coinapi.io/v1/exchangerate/ETH/${currenciesList[selectedCurrency]}?apikey=7D92C932-CCE9-4431-9069-53BFAD47D403');
                        Response output_2 = await fetchData(Url_2);
                        var responseData_2 = output_2.body;
                        currentVale_2 = jsonDecode(responseData_2)['rate'];

                        var Url_3 = Uri.parse('https://rest.coinapi.io/v1/exchangerate/LTC/${currenciesList[selectedCurrency]}?apikey=7D92C932-CCE9-4431-9069-53BFAD47D403');
                        Response output_3 = await fetchData(Url_3);
                        var responseData_3 = output_3.body;
                        currentVale_3 = jsonDecode(responseData_3)['rate'];

                      //to UPDATE THE value after fetch
                      setState(() {
                        currentVale;
                        currentVale_2;
                        currentVale_3;
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


