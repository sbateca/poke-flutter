import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter Screen'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh_rounded),
              onPressed: () {
                counter = 0;
                setState(() {});
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$counter',
                style:
                    const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
              ),
              Text(
                (counter != 1) ? 'Clicks' : 'Click',
                style: const TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomFloatingActionButton(
                icon: Icons.refresh_rounded,
                onPressed: () {
                  counter = 0;
                  setState(() {});
                }),
            const SizedBox(height: 15),
            CustomFloatingActionButton(
                icon: Icons.plus_one,
                onPressed: () {
                  counter += 1;
                  setState(() {});
                }),
            const SizedBox(height: 15),
            CustomFloatingActionButton(
                icon: Icons.exposure_minus_1_outlined,
                onPressed: () {
                  if (counter == 0) return;
                  counter -= 1;
                  setState(() {});
                })
          ],
        ));
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomFloatingActionButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      enableFeedback: true,
      elevation: 5,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
