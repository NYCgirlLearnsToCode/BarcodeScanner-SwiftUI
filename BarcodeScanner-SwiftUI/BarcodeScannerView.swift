//
//  ContentView.swift
//  BarcodeScanner-SwiftUI
//
//  Created by Lisa J on 5/29/25.
//

import SwiftUI

struct BarcodeScannerView: View {
    var body: some View {
        NavigationView {
            VStack {
                
                ScannerView()
                    .frame(maxWidth: .infinity, maxHeight: 300)
//                Rectangle()
//                    .frame(maxWidth: .infinity, maxHeight: 300)
                Spacer()
                    .frame(height: 60)
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                        .font(.title)
                Text("Not Yet Scanned")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(.red))
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
        }
    }
}

#Preview {
    BarcodeScannerView()
}
