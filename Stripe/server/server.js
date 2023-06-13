const express = require('express');
const app = express();
const stripe = require('stripe')('sk_test_51N9uxcBOyLWnHawEX1I6f9ZOuTNXwuwRZ8KGJl4YqcixIUEtjViFCzS8Yz6qqAm8gqYEmLUgDT7FO542YSsNaE40000t0YsbnU');

app.use(express.json());

app.post('/payment', async (req, res) => {
  try {
    const { amount, currency } = req.body;

    // Create a payment intent
    const paymentIntent = await stripe.paymentIntents.create({
      amount: parseInt(amount),
      currency: currency,
    });

    // Return the client secret to the Flutter app
    res.json({ clientSecret: paymentIntent.client_secret });
  } catch (error) {
    console.error('Error:', error.message);
    res.status(500).json({ error: error.message });
  }
});

app.listen(3000, () => {
  console.log('Server is running on port 3000');
});