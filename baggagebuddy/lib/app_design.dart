import 'package:flutter/material.dart';

// Colors used throughout the application
const Color appNavy = Color(0xFF133653);
const Color appGold = Color(0xFFFFBF69);
const Color appWhite = Colors.white;
const Color appBackground = Color(0xFFF5F8FC);
const Color appLightBlue = Color(0xFFEAF3F9);
const Color appSkyBlue = Color(0xFFB9D5E3);
const Color appGrey = Color(0xFF51677A);

// Main application theme
ThemeData appTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: appNavy,
    ),
    scaffoldBackgroundColor: appBackground,
  );
}

// Text styles
const TextStyle cardTitleStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: appNavy,
);

const TextStyle labelStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.bold,
  letterSpacing: 1,
  color: appGrey,
);

const TextStyle descriptionStyle = TextStyle(
  fontSize: 14,
  color: appGrey,
);

// Rounded card shape
final RoundedRectangleBorder appCardShape =
    RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(18),
);

// This function displays the header and logo
Widget travelHeader() {
  return Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.topCenter,
    children: [

      // Navy blue header
      Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 45),
        padding: const EdgeInsets.fromLTRB(
          16, 78, 16, 25,
        ),

        decoration: BoxDecoration(
          color: appNavy,
          borderRadius: BorderRadius.circular(20),
        ),

        child: Column(
          children: [

            // Boarding pass label
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    color: appGold,
                    thickness: 2,
                  ),
                ),

                SizedBox(width: 10),

                Text(
                  'BAGGAGE TRAVEL PASS',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: appSkyBlue,
                  ),
                ),

                SizedBox(width: 10),

                Expanded(
                  child: Divider(
                    color: appGold,
                    thickness: 2,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Travel Smart heading
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Travel ',
                    style: TextStyle(color: appWhite),
                  ),

                  TextSpan(
                    text: 'Smart',
                    style: TextStyle(color: appGold),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'Know your baggage fee before you fly.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: appWhite,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 22),

            // Decorative airplane icon
            const Icon(
              Icons.flight,
              color: appGold,
              size: 25,
            ),
          ],
        ),
      ),

      // White circular logo overlapping header
      Positioned(
        top: 0,
        left: 0,
        right: 0,

        child: Center(
          child: Container(
            width: 100,
            height: 100,

            decoration: const BoxDecoration(
              color: appWhite,
              shape: BoxShape.circle,

              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),

            child: Padding(
              padding: const EdgeInsets.all(12),

              child: ClipOval(
                child: Image.asset(
                  'assets/images/luggage.jpg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

// Displays baggage allowance and rates
Widget travelInformation() {
  return Card(
    color: appLightBlue,
    elevation: 0,
    margin: EdgeInsets.zero,
    shape: appCardShape,

    child: Padding(
      padding: const EdgeInsets.all(18),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Row(
            children: [
              Icon(
                Icons.info_outline,
                color: appNavy,
              ),

              SizedBox(width: 10),

              Text(
                'Travel Information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: appNavy,
                ),
              ),
            ],
          ),

          const Divider(height: 28),

          // Economy class information
          const Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Economy Class',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: appNavy,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '20 kg free allowance',
                      style: descriptionStyle,
                    ),
                  ],
                ),
              ),

              Text(
                'RM15/kg',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: appNavy,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Business class information
          const Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Business Class',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: appNavy,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '40 kg free allowance',
                      style: descriptionStyle,
                    ),
                  ],
                ),
              ),

              Text(
                'RM12/kg',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: appNavy,
                ),
              ),
            ],
          ),

          const Divider(height: 28),

          // Service tax notice
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.receipt_long_outlined,
                color: appGrey,
                size: 20,
              ),

              SizedBox(width: 10),

              Expanded(
                child: Text(
                  'An 8% service tax applies to excess baggage charges.',
                  style: descriptionStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

// Displays one line of the receipt
Widget receiptRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),

    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // Information label
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontSize: 14),
          ),
        ),

        const SizedBox(width: 10),

        // Information value
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

// Receives calculated values from main.dart
Widget baggageReceipt({
  required double weight,
  required String ticketClass,
  required double allowance,
  required double excessWeight,
  required double rate,
  required double charge,
  required double tax,
  required double total,
}) {
  return Card(
    color: appWhite,
    elevation: 2,
    margin: EdgeInsets.zero,
    shape: appCardShape,

    child: Padding(
      padding: const EdgeInsets.all(20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Receipt heading
          const Row(
            children: [
              Icon(
                Icons.confirmation_number,
                color: appNavy,
              ),

              SizedBox(width: 10),

              Expanded(
                child: Text(
                  'BAGGAGE FEE RECEIPT',
                  style: cardTitleStyle,
                ),
              ),
            ],
          ),

          const Divider(height: 30),

          // Show all baggage information
          receiptRow(
            'Baggage Weight',
            '${weight.toStringAsFixed(2)} kg',
          ),

          receiptRow(
            'Ticket Class',
            ticketClass,
          ),

          receiptRow(
            'Free Baggage Allowance',
            '${allowance.toStringAsFixed(2)} kg',
          ),

          receiptRow(
            'Excess Baggage Weight',
            '${excessWeight.toStringAsFixed(2)} kg',
          ),

          receiptRow(
            'Excess Rate per kg',
            'RM ${rate.toStringAsFixed(2)}',
          ),

          receiptRow(
            'Excess Baggage Charge',
            'RM ${charge.toStringAsFixed(2)}',
          ),

          receiptRow(
            'Service Tax (8%)',
            'RM ${tax.toStringAsFixed(2)}',
          ),

          // Airline-style separator
          const Row(
            children: [
              Expanded(child: Divider()),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Icon(
                  Icons.flight,
                  color: appGrey,
                ),
              ),

              Expanded(child: Divider()),
            ],
          ),

          const SizedBox(height: 16),

          // Total payment section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),

            decoration: BoxDecoration(
              color: appLightBlue,
              borderRadius: BorderRadius.circular(12),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Text(
                  'TOTAL AMOUNT PAYABLE',
                  style: labelStyle,
                ),

                const SizedBox(height: 8),

                Text(
                  'RM ${total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: appNavy,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
