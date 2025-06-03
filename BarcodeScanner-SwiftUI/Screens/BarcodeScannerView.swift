//
//  ContentView.swift
//  BarcodeScanner-SwiftUI
//
//  Created by Lisa J on 5/29/25.
//

import SwiftUI

struct BarcodeScannerView: View {
    
    @StateObject var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScannerView(scannedCode: $viewModel.scannedCode, errorAlert: $viewModel.alertItem, isPresented: $viewModel.isPresented)
                    .frame(maxWidth: .infinity, maxHeight: 300)

                Spacer()
                    .frame(height: 60)  

                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                        .font(.title)

                Text(viewModel.statusText)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(viewModel.statusTextColor))
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
            .alert("Error", isPresented: $viewModel.isPresented, actions: {
                if let alert = viewModel.alertItem {
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
