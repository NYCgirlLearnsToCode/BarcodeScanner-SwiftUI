//
//  BarcodeScannerViewModel.swift
//  BarcodeScanner-SwiftUI
//
//  Created by Lisa J on 6/3/25.
//

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    
    @Published var scannedCode = ""
    @Published var alertItem: AlertItem?
    @Published var isPresented = false
    
    var statusText: String {
        scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode
    }
    
    var statusTextColor: Color {
        scannedCode.isEmpty ? .red : .green
    }
}
