//
//  BluetoothTableViewCell.swift
//  BluetoothDetector
//
//  Created by Donkemezuo Raymond Tariladou on 9/2/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit
import CoreBluetooth

class BluetoothTableViewCell: UITableViewCell {

    public lazy var deviceName: UILabel = {
        let deviceName = UILabel()
        deviceName.font = UIFont.init(name: "HelveticaNeue-Bold", size: 20)
        deviceName.textColor = UIColor(hexString: "287AA9")
        deviceName.numberOfLines = 0
        return deviceName
    }()
    
    public lazy var deviceUUID: UILabel = {
        let deviceUUID = UILabel()
        deviceUUID.font = UIFont.init(name: "HelveticaNeue-Bold", size: 15)
        deviceUUID.textColor = UIColor(hexString: "287AA9")
        deviceUUID.numberOfLines = 0
        return deviceUUID
    }()
    
    public lazy var connectionStatus: UILabel = {
        let connectionStatus = UILabel()
        connectionStatus.font = UIFont.init(name: "HelveticaNeue-Bold", size: 15)
        connectionStatus.textColor = UIColor(hexString: "287AA9")
        connectionStatus.numberOfLines = 0
        return connectionStatus
    }()
    
    public lazy var statusIcon: UIImageView = {
        let statusIcon = UIImageView()
        return statusIcon
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        setBluetoothCellConstrains()
        
    }
    
    private func setBluetoothCellConstrains(){
        setDeviceNameConstrains()
        setDeviceUUIDConstrains()
        setStatusIconConstrains()
        setConnectionStatusConstrains()
        
    }
    
    private func setDeviceNameConstrains(){
        addSubview(deviceName)
        deviceName.translatesAutoresizingMaskIntoConstraints = false
        deviceName.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1.5).isActive = true
        deviceName.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 0.5).isActive = true
        deviceName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        deviceName.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25).isActive = true
    }
    
    private func setDeviceUUIDConstrains(){
        addSubview(deviceUUID)
        deviceUUID.translatesAutoresizingMaskIntoConstraints = false
        deviceUUID.topAnchor.constraint(equalToSystemSpacingBelow: deviceName.bottomAnchor, multiplier: 0.05).isActive = true
        deviceUUID.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 0.5).isActive = true
        deviceUUID.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2).isActive = true
        deviceUUID.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25).isActive = true
    }
    
    private func setStatusIconConstrains(){
        addSubview(statusIcon)
        statusIcon.translatesAutoresizingMaskIntoConstraints = false
        statusIcon.topAnchor.constraint(equalToSystemSpacingBelow: deviceUUID.bottomAnchor, multiplier: 0.2).isActive = true
        statusIcon.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.12).isActive = true
        statusIcon.centerXAnchor.constraint(equalToSystemSpacingAfter: centerXAnchor, multiplier: 0.6).isActive = true
        // statusIcon.bottomAnchor.constraint(equalToSystemSpacingBelow: bottomAnchor, multiplier: 0.15).isActive = true
        statusIcon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }
    
    private func setConnectionStatusConstrains(){
        addSubview(connectionStatus)
        connectionStatus.translatesAutoresizingMaskIntoConstraints = false
        connectionStatus.topAnchor.constraint(equalTo: statusIcon.topAnchor).isActive = true
        connectionStatus.leadingAnchor.constraint(equalToSystemSpacingAfter: statusIcon.trailingAnchor, multiplier: 0.2).isActive = true
        connectionStatus.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: 0.1).isActive = true
        connectionStatus.bottomAnchor.constraint(equalTo: statusIcon.bottomAnchor).isActive = true
    }
    
    public func setBlueToothDeviceInfo(onBlueToothCell bluetoothCell: BluetoothTableViewCell, withDevice device: CBPeripheral){
        
        if let deviceName = device.name {
            bluetoothCell.deviceName.text = deviceName
            bluetoothCell.deviceUUID.text = "UUID:\(device.identifier)"
        } else {
            bluetoothCell.deviceName.text = "Unknown Bluetooth Name"
            bluetoothCell.deviceUUID.text = "UUID:  \(device.identifier)"
        }
        
        if device.state == .connected {
            bluetoothCell.statusIcon.image = #imageLiteral(resourceName: "icons8-bluetooth_filled.png").withRenderingMode(.alwaysTemplate)
            bluetoothCell.statusIcon.tintColor = UIColor(hexString: "287AA9")
            bluetoothCell.connectionStatus.text = "Connected"
        } else if device.state == .disconnected {
            bluetoothCell.statusIcon.image = #imageLiteral(resourceName: "icons8-bluetooth_filled.png").withRenderingMode(.alwaysTemplate)
            bluetoothCell.statusIcon.tintColor = UIColor.lightGray
            bluetoothCell.connectionStatus.text = "Not Connected"
        }
    }

}
