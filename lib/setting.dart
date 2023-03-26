import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        backgroundColor: const Color.fromARGB(255, 165, 194, 248),
        appBar: AppBar(
          title: const Text("Store Calc"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //// CHANGING PRICE FOR SOFT CONE
              ///
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: soft,
                onChanged: (value) {
                  _soft = double.parse(value);
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(2),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    label: const Text(
                      "Soft Cone Price",
                      style: TextStyle(fontSize: 20),
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
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                      "Hard Cone Price",
                      style: TextStyle(fontSize: 20),
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
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                      "Shine  Price",
                      style: TextStyle(fontSize: 20),
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
                height: 20,
              ),

              ///// THE SETTING HAPPENS WHEN THISN BUTTON IS PRESSED
              ///
              ElevatedButton(
                  onPressed: () {
                    setState(() {_saveData();
});
                  },
                  child: const Text("Set Prices"))
            ],
          ),
        ));
  }
}
