# BaggageBuddy 

### Excess Baggage Fee Calculator

BaggageBuddy is a Flutter mobile application developed for the ICT602 Mobile Technology Development at Universiti Teknologi MARA (UiTM).

The application helps air travellers estimate their excess baggage fees based on baggage weight, ticket class, and baggage rate per kilogram.

## Features

- Calculate excess baggage weight and charges.
- Select Economy or Business ticket class.
- Automatically display the baggage rate based on the selected ticket class.
- Calculate total payment including 8% service tax.
- Display a detailed baggage fee receipt.
- Show error messages for invalid baggage weight.
- Reset the form and calculation results.
- View application and developer information on the About Page.

## Baggage Allowance and Rates

| Ticket Class | Free Allowance | Excess Baggage Rate |
|---|---|---|
| Economy | 20 kg | RM15.00/kg |
| Business | 40 kg | RM12.00/kg |

The application uses these rates for the assignment calculation.

## Calculation Formula

**Excess Baggage Weight**

Excess Weight = Maximum of (0, Baggage Weight - Free Allowance)

**Excess Baggage Charge**

Excess Charge = Excess Weight × Rate per kg

**Service Tax**

Service Tax = Excess Charge × 8%

**Total Amount Payable**

Total Payment = Excess Charge + Service Tax

## Example Calculation

For a passenger travelling in Economy Class with 25 kg of checked baggage:

- Baggage Weight: 25 kg
- Free Allowance: 20 kg
- Excess Weight: 5 kg
- Rate: RM15.00/kg
- Excess Charge: RM75.00
- Service Tax (8%): RM6.00

**Total Amount Payable: RM81.00**

## Technologies Used

- Flutter
- Dart
- Visual Studio Code
- Material Design
- url_launcher package

## How to Run the Application

1. Install Flutter SDK and set up the Flutter development environment.
2. Clone or download this repository.
3. Open the `baggagebuddy` project folder containing `pubspec.yaml` in VS Code.
4. Run `flutter pub get` to install dependencies.
5. Connect an Android device or start an emulator.
6. Run `flutter run` to launch the application.

## Developer Information

**Course:** ICT602 - Mobile Technology Development

**Institution:** Universiti Teknologi MARA (UiTM)

## Copyright

© 2026 BaggageBuddy. All Rights Reserved.
