import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = 'pk_test_51N9uxcBOyLWnHawEceDN9ySY6DNQftz8IqRAEp6noMdENEyWy3PtPvbOaBhSHHt7b8Ukn4Pje4RT0Y5HMkpZO1Tl00czjzoEA6';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stripe Payment Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _amountController = TextEditingController();
  bool _isLoading = false;

  Future<String> _createPaymentIntent(String amount) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/payment'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'amount': amount,
        'currency': 'usd',
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['clientSecret'];
    } else {
      throw Exception('Failed to create payment intent');
    }
  }

  Future<void> _makePayment(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });

    final amount = _amountController.text;

    try {
      final clientSecret = await _createPaymentIntent(amount);

      // final paymentMethod = PaymentMethodData.fromJson({
      //   'billingDetails': {
      //     'email': 'test@example.com',
      //     'name': 'Test User',
      //   },
      // });

      final paymentIntent = await Stripe.instance.confirmPayment(
        paymentIntentClientSecret: clientSecret,
      );

      if (paymentIntent.status == 'succeeded') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SuccessPage(),
          ),
        );
      } else {
        throw Exception('Payment failed');
      }
    } catch (error) {
      print('Error: $error');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ErrorPage(),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stripe Payment Demo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : () => _makePayment(context),
              child: _isLoading
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  : const Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Success'),
      ),
      body: const Center(
        child: Text(
          'Payment Successful',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text(
          'Payment Error',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
