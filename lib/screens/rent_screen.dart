import 'package:flutter/material.dart';
import 'package:ayosproj/models/product.dart';
import 'package:ayosproj/screens/checkout_screen.dart';

class RentScreen extends StatefulWidget {
  final Product product;

  const RentScreen(this.product, {Key? key}) : super(key: key);

  @override
  _RentScreenState createState() => _RentScreenState();
}

class _RentScreenState extends State<RentScreen> {
  int itemCount = 1;
  double marginTop = 16.0;
  DateTime? startDate;
  DateTime? endDate;
  String selectedExpedition = 'JNE';

  void increaseItemCount() {
    setState(() {
      itemCount++;
    });
  }

  void decreaseItemCount() {
    if (itemCount > 1) {
      setState(() {
        itemCount--;
      });
    }
  }

  Future<void> _selectDate(BuildContext context, String type) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: type == 'start'
          ? startDate ?? DateTime.now()
          : endDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.orangeAccent,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        if (type == 'start') {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rent Screen'),
      ),
      backgroundColor: const Color(0xFF2C3250),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: marginTop),
          child: SizedBox(
            width: 356,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 99,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.network(
                            widget.product.imageUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product.name,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    ' ${widget.product.price}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: decreaseItemCount,
                                        icon: const Icon(Icons.remove),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        '$itemCount',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      IconButton(
                                        onPressed: increaseItemCount,
                                        icon: const Icon(Icons.add),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 1,
                  color: Colors.grey,
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => _selectDate(context, 'start'),
                        child: Row(
                          children: [
                            const Icon(Icons.arrow_drop_down),
                            Text(
                              startDate != null
                                  ? 'Start Date: ${startDate!.toString()}'
                                  : 'Select Start Date',
                              style: TextStyle(
                                fontSize: 16,
                                color: startDate != null
                                    ? Colors.white
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () => _selectDate(context, 'end'),
                        child: Row(
                          children: [
                            const Icon(Icons.arrow_drop_down),
                            Text(
                              endDate != null
                                  ? 'End Date: ${endDate!.toString()}'
                                  : 'Select End Date',
                              style: TextStyle(
                                fontSize: 16,
                                color: endDate != null
                                    ? Colors.white
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 1,
                  color: Colors.grey,
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.local_shipping),
                      Container(
                        width: 280,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              icon: const Icon(Icons.arrow_drop_down),
                              value: selectedExpedition,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedExpedition = newValue!;
                                });
                              },
                              items: <String>[
                                'JNE',
                                'Tiki',
                                'Pos Indonesia',
                                'Gojek'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 350.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CheckoutScreen(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.orangeAccent),
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(348, 58)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  child: Container(
                    width: 348,
                    height: 58,
                    alignment: Alignment.center,
                    child: const Text(
                      'Next',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
