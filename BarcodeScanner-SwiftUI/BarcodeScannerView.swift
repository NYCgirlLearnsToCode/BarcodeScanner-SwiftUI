//
//  ContentView.swift
//  BarcodeScanner-SwiftUI
//
//  Created by Lisa J on 5/29/25.
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
struct BarcodeScannerView: View {
    
    @State private var scannedCode = ""
    @State private var alertItem: AlertItem?
    @State private var isPresented = false
    
    var body: some View {
        NavigationView {
            VStack {
                ScannerView(scannedCode: $scannedCode, errorAlert: $alertItem, isPresented: $isPresented)
                    .frame(maxWidth: .infinity, maxHeight: 300)

                Spacer()
                    .frame(height: 60)  

                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                        .font(.title)

                Text(scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(scannedCode.isEmpty ? .red : .green))
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
            //show alert when there is an error
            .alert("Error", isPresented: $isPresented, actions: {
                if let alert = alertItem {
                    Text(alert.message)
                    Button("ok", action: {
                    })
                }
            })
        }
    }
}

#Preview {
    BarcodeScannerView()
}
