import "package:flutter/cupertino.dart";

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() =>
      _CurrencyConverterCupertinoPage();
}

class _CurrencyConverterCupertinoPage
    extends State<CurrencyConverterCupertinoPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    result = double.parse(textEditingController.text) * 81;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey3,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey3,
        middle: Text(
          "Currency Converter",
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //int => string integervalue.toString()
              //string -> int int.parse(Stringvalue)
              Text(
                'INR ${result != 0 ? result.toStringAsFixed(3) : result.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),

              CupertinoTextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: Color.fromARGB(255, 10, 10, 10),
                  fontWeight: FontWeight.bold,
                ),
                decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                placeholder: "Please enter the amount in USD ",
                prefix: const Icon(CupertinoIcons.money_dollar),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  // signed: true,
                ),
              ),
              const SizedBox(height: 10),
              //appears like a text
              CupertinoButton(
                onPressed: convert,
                color: CupertinoColors.black,
                borderRadius: BorderRadius.circular(10),
                // minSize: ,
                child: const Text('Convert'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
