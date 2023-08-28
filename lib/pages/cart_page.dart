import 'package:flutter/material.dart';
import 'package:flutter01/components/coffee_tile.dart';
import 'package:flutter01/models/coffee.dart';
import 'package:flutter01/models/coffee_shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  //remove cart item
  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);
  }

  //pay buttom tapped
  void payNow(){
    /*
        fill out your payment service here
     */
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
        builder: (context, value, child) => SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    //heading
                    Text(
                      'Your Cart',
                      style: TextStyle(fontSize: 20),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: value.userCart.length,
                        itemBuilder: (context, index) {
                        // get individual coffee
                        Coffee eachCoffee = value.userCart[index];

                        //return coffee tile
                        return CoffeeTile(
                          coffee: eachCoffee,
                          onpressed: () => removeFromCart(eachCoffee),
                          icon: Icon(Icons.delete),
                        );
                      }),
                    ),
                    //pay buttom
                    GestureDetector(
                      onTap: payNow,
                      child: Container(
                        padding: const EdgeInsets.all(25),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.red[500],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                              "Pay Now",
                              style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                )
            )
        )
    );
  }
}
