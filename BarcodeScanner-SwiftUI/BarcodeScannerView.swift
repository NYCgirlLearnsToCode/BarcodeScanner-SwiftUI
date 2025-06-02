//
//  ContentView.swift
//  BarcodeScanner-SwiftUI
//
//  Created by Lisa J on 5/29/25.
//

import SwiftUI

struct BarcodeScannerView: View {
    
    @State private var scannedCode = ""
    
    var body: some View {
        NavigationView {
            VStack {
                ScannerView(scannedCode: $scannedCode)
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
        }
    }
}

#Preview {
    BarcodeScannerView()
}
