import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bluetooth Demo',
      home: BluetoothScreen(),
    );
  }
}

class BluetoothScreen extends StatefulWidget {
  @override
  _BluetoothScreenState createState() => _BluetoothScreenState();
}

class _BluetoothScreenState extends State<BluetoothScreen> {
  List<ScanResult> scanResults = [];

  @override
  void initState() {
    super.initState();
    initBluetooth();
  }

  Future<void> initBluetooth() async {
    // Request permissions
    await Permission.bluetooth.request();
    await Permission.bluetoothScan.request();
    await Permission.bluetoothConnect.request();
    await Permission.location.request();

    // ✅ Check if Bluetooth is available and turned ON
    final state = await FlutterBluePlus.adapterState.first;
    if (state != BluetoothAdapterState.on) {
      print('Bluetooth is not ON. Please enable it.');
      return;
    }

    // ✅ Start scanning
    await FlutterBluePlus.startScan(timeout: Duration(seconds: 4));

    // ✅ Listen to scan results
    FlutterBluePlus.scanResults.listen((results) {
      setState(() {
        scanResults = results;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bluetooth Devices")),
      body: ListView.builder(
        itemCount: scanResults.length,
        itemBuilder: (context, index) {
          final result = scanResults[index];
          return ListTile(
            title: Text(result.device.platformName.isNotEmpty
                ? result.device.platformName
                : 'Unknown'),
            subtitle: Text(result.device.remoteId.str),
            onTap: () async {
              try {
                await result.device.connect();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Connected to ${result.device.platformName}')),
                );
              } catch (e) {
                print('Error connecting: $e');
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () async {
          await FlutterBluePlus.startScan(timeout: Duration(seconds: 4));
        },
      ),
    );
  }
}
