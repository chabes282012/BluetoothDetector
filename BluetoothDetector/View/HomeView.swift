//
//  HomeView.swift
//  BluetoothDetector
//
//  Created by Donkemezuo Raymond Tariladou on 9/2/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class HomeView: UIView {

 
    private lazy var barView: UIView = {
        let barView = UIView()
        barView.backgroundColor = UIColor(hexString: "287AA9")
        return barView
    }()
    
    private lazy var appTitle: UILabel = {
        let appTitle = UILabel()
        appTitle.font =  UIFont.init(name: "HelveticaNeue-Bold", size: 30)
        appTitle.text = "Bluetooth Detector"
        appTitle.textColor = .white
        return appTitle
        
    }()
    
    public lazy var bluetoothTableView: UITableView = {
        let bluetoothTableView = UITableView()
        bluetoothTableView.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        return bluetoothTableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        bluetoothTableView.register(BluetoothTableViewCell.self, forCellReuseIdentifier: "BluetoothTableViewCell")
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    private func commonInit(){
        setViewConstrains()
    }
    
    private func setViewConstrains(){
        setBarViewConstrains()
        setAppTitleConstrains()
        setBluetoothTableViewConstrains()
        
    }
    
    private func setBarViewConstrains(){
        addSubview(barView)
        barView.translatesAutoresizingMaskIntoConstraints = false
        barView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        barView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        barView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        barView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.16).isActive = true
    }
    
    private func setAppTitleConstrains(){
        barView.addSubview(appTitle)
        appTitle.translatesAutoresizingMaskIntoConstraints = false
        appTitle.heightAnchor.constraint(equalTo: barView.heightAnchor, multiplier: 0.25).isActive = true
        appTitle.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 0.5).isActive = true
        appTitle.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        appTitle.bottomAnchor.constraint(equalTo: barView.bottomAnchor, constant: -5).isActive = true
    }
    
    private func setBluetoothTableViewConstrains(){
        addSubview(bluetoothTableView)
        bluetoothTableView.translatesAutoresizingMaskIntoConstraints = false
        bluetoothTableView.topAnchor.constraint(equalTo: barView.bottomAnchor).isActive = true
        bluetoothTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bluetoothTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bluetoothTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
}
