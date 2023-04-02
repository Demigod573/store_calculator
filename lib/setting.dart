import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  TextEditingController shine = TextEditingController();

  TextEditingController soft = TextEditingController();

  TextEditingController hard = TextEditingController();

  double _shine = 0;
  double _soft = 0;
  double _hard = 0;

   
  Future<void> _saveData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    localStorage.setDouble('SHINE', _shine);
    localStorage.setDouble('SOFT', _soft);
    localStorage.setDouble('HARD', _hard);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 42, 42, 43),
        appBar: AppBar(backgroundColor: Color.fromARGB(255, 42, 41, 41),
          title: const Text("  Yarn Price  📝", style: TextStyle(fontSize: 30,color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 2),),
          centerTitle: true, elevation: 20,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //// CHANGING PRICE FOR SOFT CONE
                  ///
                  TextField(style: GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 25),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    controller: soft,
                    onChanged: (value) {
                      _soft = double.parse(value);
                    },
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(2),
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        label: const Text(
                          "         Soft Cone Price ",
                          style: TextStyle(fontSize: 20, color: Colors.white, letterSpacing: 2),
                        ),
                        suffix: IconButton(
                            onPressed: () {
                              soft.clear();
                            },
                            icon: const Icon(Icons.cancel_outlined))),
                  ),
                  const SizedBox(
                    height: 30,
          
                    //// CHANGING PRICE FOR HARD CONE
                  ),
                  TextField(style: GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 25),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    controller: hard,
                    onChanged: (value) {
                      setState(() {
                        _hard = double.parse(value);
                      });
                    },
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(2),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        label: const Text(
                          "          Hard Cone Price",
                          style: TextStyle(fontSize: 20,color: Colors.white, letterSpacing: 2),
                        ),
                        suffix: IconButton(
                            onPressed: () {
                              setState(() {
                                hard.clear();
                              });
                            },
                            icon: const Icon(Icons.cancel_outlined))),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
          
                  /// CHANGING PRICE FOR SHINE
                  TextField(style: GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 25),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    controller: shine,
                    onChanged: (value) {
                      setState(() {
                        _shine = double.parse(value);
                      });
                    },
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(2),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        label: const Text(
                          "            Shine  Price",
                          style: TextStyle(fontSize: 20,color: Colors.white, letterSpacing: 2),
                        ),
                        suffix: IconButton(
                            onPressed: () {
                              setState(() {
                                shine.clear();
                              });
                            },
                            icon: const Icon(Icons.cancel_outlined))),
                  ),
                  const SizedBox(
                    height: 90,
                  ),
          
                  ///// THE SETTING HAPPENS WHEN THISN BUTTON IS PRESSED
                  ///
                  ElevatedButton( style: ElevatedButton.styleFrom(primary: Color.fromARGB(167, 41, 68, 71)),
                      onPressed: () {
                        setState(() {_saveData();
          });
                      },
                      child: const Text(" \n Set Prices \n       ✍🏿", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 2),))
                ],
              ),
            ),
          ),
        ));
  }
}
