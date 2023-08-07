import 'package:flutter/material.dart';
import 'package:tip_calculator/widgets/SimpleButtton.dart';
import 'package:tip_calculator/widgets/SimpleInputField.dart';

class TipCalculator extends StatefulWidget {
  const TipCalculator({super.key});

  @override
  State<TipCalculator> createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  final formKey = GlobalKey<FormState>();

  final totalBillController = TextEditingController();
  final totalTipController = TextEditingController();
  final totalPeopleController = TextEditingController();

  static const Color containerColor = Color(0xffF5F8F8);
  static const Color textBlack = Color(0xff232323);
  static const Color textLightblack = Color(0xff717171);
  static const Color clearButtonColor = Color(0xffFF7511);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tip Calculator",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        elevation: 3,
        shadowColor: Colors.black.withOpacity(0.3),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ///top section
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(5)),
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const Text(
                      "Total Bill",
                      style: TextStyle(color: textLightblack),
                    ),
                    Text(
                      "\$ ${totalBillController.text}",
                      style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: textBlack),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Persons",
                            style: TextStyle(color: textLightblack)),
                        Text("Tip Ammount",
                            style: TextStyle(color: textLightblack))
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("05",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: textBlack)),
                        Text("\$ 20.0",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: textBlack))
                      ],
                    )
                  ],
                ),
              ),

              ///gap
              const SizedBox(
                height: 10,
              ),

              ///per person amount section
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(5)),
                padding: const EdgeInsets.all(15),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Amount Per Person",
                        style: TextStyle(color: textLightblack)),
                    Text("\$ 20.0",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: textBlack))
                  ],
                ),
              ),

              const Spacer(),

              const Text(
                "Total Bill",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: textBlack),
              ),
              const SizedBox(
                height: 3,
              ),
              SimpleInputField(
                controller: totalBillController,
                title: "Total Bill",
                hintText: "Please Enter The Total Bill",
                iconData: Icons.attach_money,
              ),
              SimpleInputField(
                  controller: totalTipController,
                  title: "Tip Percentage",
                  iconData: Icons.percent,
                  hintText: "Please Enter The Tip Percentage"),
              SimpleInputField(
                  controller: totalPeopleController,
                  iconData: Icons.people,
                  title: "Number Of Person",
                  hintText: "Please Enter The Number Of Person"),
              Row(
                children: [
                  Expanded(
                    child: SimpleButton(
                      btnTitle: "Calculate",
                      btnColor: Colors.white,
                      onTap: () {
                        formKey.currentState!.validate();
                      },
                    ),
                  ),
                  SimpleButton(
                    btnTitle: "Clear",
                    btnColor: clearButtonColor,
                    onTap: () {},
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
