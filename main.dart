import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

void main() {
  runApp(const EcoFlowApp());
}

class EcoFlowApp extends StatelessWidget {
  const EcoFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoFlow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const EcoHomePage(),
    );
  }
}

class EcoHomePage extends StatelessWidget {
  const EcoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('MMM dd, h:mm a').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade100,
        title: const Text('EcoFlow 🌿', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          Center(child: Text(formattedDate, style: const TextStyle(fontSize: 14))),
          const SizedBox(width: 10),
          const Icon(Icons.settings),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting + Weather
            const Text(
              "Good Morning, Kevin!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text("🌤️ 28°C | Windy", style: TextStyle(fontSize: 16)),
            const Divider(height: 30),

            // First Task
            Card(
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.directions_bus),
                title: const Text("Bus to College"),
                subtitle: const Text("7:30 AM"),
              ),
            ),
            const Divider(height: 30),

            // EcoScore
            const Text("EcoScore", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            const SizedBox(height: 10),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: CircularProgressIndicator(
                      value: 0.72,
                      strokeWidth: 12,
                      backgroundColor: Colors.grey.shade300,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ),
                  const Text("72/100", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const Spacer(),

            // Add Task & Plan Day
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text("Add Task"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade400),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.calendar_today),
                  label: const Text("Plan My Day"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
