import 'package:flutter/material.dart';
import 'package:layout_assignment/main.dart';

class Device {
  final String name;
  final Icons icon;
  bool switchh = false;

  Device ({
    required this.name,
    required this.icon,
    required this.switchh,
  });
}

class AppTab extends StatelessWidget {
  final List<Device> deviceItem;
  final Function onToggle;

  AppTab(this.deviceItem, this.onToggle);

  get icon => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey, Colors.blueGrey],
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
        ),
      ),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        childAspectRatio: 1.1,
        children: deviceItem
            .map((deviceItem) => Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        //Icon(deviceItem.icon),
                        InkWell(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(9.0),
                          
                          ),
                          onTap: () => onToggle(deviceItem.name),
                        ),
                        Spacer(),
                        if (deviceItem.switchh)
                          Icon(Icons.toggle_on_rounded,
                              color: Colors.green, size: 50.0),
                        if (!deviceItem.switchh)
                          Icon(Icons.toggle_off_outlined, size: 50.0),
                      ]),
                      Spacer(),
                      Text(deviceItem.name,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold)),
                      SizedBox(height: 2.0),
                      Text(
                        '• ${deviceItem.switchh ? 'ON' : 'OFF'}',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: deviceItem.switchh ? Colors.teal : Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}