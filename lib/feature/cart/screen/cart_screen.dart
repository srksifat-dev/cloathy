import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<bool> isChecked = [
    true,
    true,
    false,
    true,
    false,
  ];
  List<int> quantity = [
    1,
    1,
    2,
    2,
    3,
  ];
  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height / 100;
    double sw = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      backgroundColor: Color(0xfff3f3f3),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
              child: Text(
                "Your Cart",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Checkbox(
                          activeColor: Colors.black,
                          shape: CircleBorder(),
                          value: isChecked[index],
                          onChanged: (val) {
                            setState(() {
                              isChecked[index] = val!;
                            });
                          }),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              "assets/images/men.jpg",
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            )),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Product Name",
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                          Text(
                            "Product Size",
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                          Text(
                            "৳ 300",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SizedBox(
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      quantity[index]--;
                                    });
                                  },
                                  icon: Icon(Icons.remove)),
                              Text(
                                "${quantity[index].toString()}",
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      quantity[index]++;
                                    });
                                  },
                                  icon: Icon(Icons.add)),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
                separatorBuilder: (_, __) => SizedBox(
                  height: 16,
                ),
                itemCount: 5,
              ),
            ),
            Container(
              height: sh * 20,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
                child: Column(
                  children: [
                    Text(
                      "Order Info",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "৳ 60",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Expense",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "৳ 360",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    FilledButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.black)),
                      onPressed: () {},
                      child: Text("Place the Order"),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
