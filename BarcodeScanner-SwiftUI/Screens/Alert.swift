//
//  Alert.swift
//  BarcodeScanner-SwiftUI
//
//  Created by Lisa J on 6/3/25.
//

import SwiftUI

struct AlertItem {
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidDeviceInput = Alert(title: Text("Invalid device input"),
                                          message: Text("Something is wrong with the camera. We are unable to capture the input."),
                                          dismissButton: .default(Text("OK")))
    static let invalidScannedType = Alert(title: Text("Invalid scan type"),
                                          message: Text("The value scanned is not valid. This app scans EAN-8 and EAN-13"),
                                          dismissButton: .default(Text("OK")))
}
