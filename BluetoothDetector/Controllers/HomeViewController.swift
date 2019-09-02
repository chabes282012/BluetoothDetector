//
//  ViewController.swift
//  BluetoothDetector
//
//  Created by Donkemezuo Raymond Tariladou on 9/2/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit
import CoreBluetooth

class HomeViewController: UIViewController {

    private var homeView = HomeView()
    private var nearbyBluetoothDevices = [CBPeripheral]() {
        didSet {
            DispatchQueue.main.async {
                self.homeView.bluetoothTableView.reloadData()
            }
        }
    }
    private var centralManager = CBCentralManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        view.addSubview(homeView)
        centralManager.delegate = self
        print(nearbyBluetoothDevices.count)
      //  homeView.bluetoothTableView.dataSource = self
       // homeView.bluetoothTableView.delegate = self
    }
}

extension HomeViewController: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            centralManager.scanForPeripherals(withServices: nil, options: nil)
        } else {
            showAlert(title: "Attention", message: "Please turn on the Bluetooth of your device. Go to Setting ==>> Bluetooth ==>> ON")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if !nearbyBluetoothDevices.contains(peripheral) {
            nearbyBluetoothDevices.append(peripheral)
            print(nearbyBluetoothDevices.count)
        }
    }
}




