
import 'package:flutter/material.dart';

//import about page + app design file
import 'about_page.dart';
import 'app_design.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BaggageBuddy',

      // theme from app_design 
      theme: appTheme(),

      // home page (on launch)
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // user input + auto rate controllers
  final TextEditingController weightController =
      TextEditingController();

  final TextEditingController rateController =
      TextEditingController();

  // selected ticket + validation (string?)
  String? selectedClass;
  String? weightError;

  // fixed rates
  static const double economyRate = 15.0;
  static const double businessRate = 12.0;

  // variable for calc results
  double baggageWeight = 0;
  double freeAllowance = 0;
  double ratePerKg = 0;
  double excessWeight = 0;
  double excessCharge = 0;
  double serviceTax = 0;
  double totalPayment = 0;

  // show/hide result after calc
  bool showResult = false;

  // release controller (when not in use)
  @override
  void dispose() {
    weightController.dispose();
    rateController.dispose();
    super.dispose();
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void calculateFee() {

    // convert input to decimal (double)
    double? weight = double.tryParse(
      weightController.text.trim(),
    );

    // weight validation
    if (weight == null || !weight.isFinite) {
      showMessage('Please enter a valid baggage weight.');
      return;
    }

    if (weight < 0) {
      showMessage('Baggage weight cannot be negative.');
      return;
    }

    // ticket class validation
    if (selectedClass == null) {
      showMessage('Please select a ticket class.');
      return;
    }

    // economy allowed and rate
    double allowance = 20;
    double rate = economyRate;

    // business allowed and rate
    if (selectedClass == 'Business') {
      allowance = 40;
      rate = businessRate;
    }

    // calc excess weight bag
    double extra = weight - allowance;

    // prevent negative excess
    if (extra < 0) {
      extra = 0;
    }

    // calc excess charge
    double charge = extra * rate;

    // calc 8% rate tax
    double tax = charge * 0.08;

    // calc total payable
    double total = charge + tax;

    // results to display in receipt
    setState(() {
      baggageWeight = weight;
      freeAllowance = allowance;
      ratePerKg = rate;
      excessWeight = extra;
      excessCharge = charge;
      serviceTax = tax;
      totalPayment = total;
      showResult = true;
    });
  }

  void resetForm() {

    //reset clear input value
    weightController.clear();
    rateController.clear();

    setState(() {
      selectedClass = null;
      weightError = null; // clear error message
      showResult = false;
    });

    showMessage('All fields have been cleared.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // app title bar + about menu
      appBar: AppBar(
        backgroundColor: appNavy,
        foregroundColor: appWhite,

        title: const Row(
          children: [
            Icon(Icons.flight_takeoff),
            SizedBox(width: 10),
            Text(
              'BaggageBuddy',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        // about page menu
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {

              // Open About Page
              if (value == 'About') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutPage(),
                  ),
                );
              }
            },

            itemBuilder: (context) => const [
              PopupMenuItem(
                value: 'About',
                child: Text('About'),
              ),
            ],
          ),
        ],
      ),

      // scrollable
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // app logo + name
            travelHeader(),

            const SizedBox(height: 20),

            // baggage details form + receipt
            travelInformation(),

            const SizedBox(height: 20),

            //baggage fee display
            Card(
              color: appWhite,
              elevation: 2,
              margin: EdgeInsets.zero,
              shape: appCardShape,

              child: Padding(
                padding: const EdgeInsets.all(18),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // form title
                    const Row(
                      children: [
                        Icon(
                          Icons.airplane_ticket,
                          color: appNavy,
                        ),

                        SizedBox(width: 12),

                        Text(
                          'Baggage Details',
                          style: cardTitleStyle,
                        ),
                      ],
                    ),

                    const Divider(height: 30),

                    const Text(
                      'Enter your baggage weight and select your ticket class.',
                      style: descriptionStyle,
                    ),

                    const SizedBox(height: 22),

                    // input : baggage weight
                    const Text(
                      '01  BAGGAGE WEIGHT',
                      style: labelStyle,
                    ),

                    const SizedBox(height: 12),

                    TextField(
                      controller: weightController,

                      // allow decimal + negative (validation will handle negative)
                      keyboardType:
                          const TextInputType.numberWithOptions(
                        decimal: true,
                        signed: true,
                      ),

                      decoration: InputDecoration(
                        labelText: 'Baggage Weight (kg)',
                        hintText: 'Example: 25.5',
                        prefixIcon: const Icon(Icons.luggage),
                        border: const OutlineInputBorder(),
                        errorText: weightError, // Show error under input
                      ),

                      // validate weight input on change
                      onChanged: (value) {
                        double? weight = double.tryParse(value.trim());

                        setState(() {
                          if (value.trim().isEmpty) {
                            weightError = 'Please enter your baggage weight.';
                          } else if (weight == null || !weight.isFinite) {
                            weightError = 'Please enter a valid number.';
                          } else if (weight < 0) {
                            weightError = 'Baggage weight cannot be negative.';
                          } else {
                            weightError = null;
                          }

                          // hide result if user changes input
                          showResult = false;
                        });
                      },
                    ),

                    const SizedBox(height: 24),

                    // input 2: ticket class
                    const Text(
                      '02  TICKET CLASS',
                      style: labelStyle,
                    ),

                    const SizedBox(height: 10),

                    RadioGroup<String>(
                      groupValue: selectedClass,

                      onChanged: (value) {
                        setState(() {
                          selectedClass = value;

                          // auto set rate
                          if (selectedClass == 'Economy') {
                            rateController.text =
                                economyRate.toStringAsFixed(2);

                          } else if (selectedClass == 'Business') {
                            rateController.text =
                                businessRate.toStringAsFixed(2);
                          }

                          showResult = false;
                        });
                      },

                      child: const Column(
                        children: [

                          RadioListTile<String>(
                            title: Text('Economy Class'),
                            subtitle: Text('20 kg allowance'),
                            value: 'Economy',
                          ),

                          RadioListTile<String>(
                            title: Text('Business Class'),
                            subtitle: Text('40 kg allowance'),
                            value: 'Business',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // input 3: auto rate display (read-only)
                    const Text(
                      '03  EXCESS BAGGAGE RATE',
                      style: labelStyle,
                    ),

                    const SizedBox(height: 12),

                    TextField(
                      controller: rateController,

                      // fixed rate
                      readOnly: true,

                      decoration: const InputDecoration(
                        labelText: 'Rate per kg (RM)',
                        hintText: 'Select ticket class first',
                        prefixIcon: Icon(Icons.lock_outline),
                        filled: true,
                        fillColor: appLightBlue,
                        border: OutlineInputBorder(),
                        helperText:
                            'Automatically set by ticket class.',
                      ),
                    ),

                    const SizedBox(height: 25),

                    // calc button
                    SizedBox(
                      width: double.infinity,
                      height: 50,

                      child: FilledButton.icon(
                        onPressed: calculateFee,
                        icon: const Icon(Icons.calculate),

                        label: const Text(
                          'Calculate Baggage Fee',
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // reset button
                    SizedBox(
                      width: double.infinity,

                      child: OutlinedButton.icon(
                        onPressed: resetForm,
                        icon: const Icon(Icons.refresh),
                        label: const Text('Reset Details'),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // display receipt after calc
            if (showResult)
              Padding(
                padding: const EdgeInsets.only(top: 20),

                child: baggageReceipt(
                  weight: baggageWeight,
                  ticketClass: selectedClass ?? '',
                  allowance: freeAllowance,
                  excessWeight: excessWeight,
                  rate: ratePerKg,
                  charge: excessCharge,
                  tax: serviceTax,
                  total: totalPayment,
                ),
              ),

            const SizedBox(height: 25),

            // app footer
            const Center(
              child: Text(
                'BaggageBuddy | Travel with confidence',
                textAlign: TextAlign.center,
                style: descriptionStyle,
              ),
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
