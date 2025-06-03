//
//  ScannerView.swift
//  BarcodeScanner-SwiftUI
//
//  Created by Lisa J on 5/29/25.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var scannedCode: String
    @Binding var errorAlert: AlertItem?
    @Binding var isPresented: Bool

    func makeUIViewController(context: Context) -> ScannerViewController {
        ScannerViewController(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
    
    final class Coordinator: NSObject, ScannerVCDelegate {
        
        private let scannerView: ScannerView
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }

        func didFind(barcode: String) {
            scannerView.scannedCode = barcode
            print(barcode)
        }
        
        func didSurface(error: CameraError) {
            if error == .invalidDeviceInput {
                scannerView.errorAlert = AlertItem(title: "invalid device", message: "invalid device input", dismissButton: .default(Text("OK")))
            } else if error == .invalidScannedValue {
                scannerView.errorAlert = AlertItem(title: "invalid scanned value", message: "invalid scanned value", dismissButton: .default(Text("OK")))
            }
            
            scannerView.isPresented = true
            
        }
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView(scannedCode: .constant("hi"), errorAlert: .constant(AlertItem(title: "test", message: "wow", dismissButton: .cancel())), isPresented: .constant(true))
    }
}
