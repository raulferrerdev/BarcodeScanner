//
//  BarcodeScannerView.swift
//  BarcodeScanner
//
//  Created by RaulF on 30/7/21.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismissBtutton: Alert.Button
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: "Invalid Device Input",
                                              message: "Something is wrong with the camera. We are unable to capture the input.", 
                                              dismissBtutton: .default(Text("Ok")))
    static let invalidScannedValue = AlertItem(title: "Invalid Scan Type",
                                               message: "The value scanned is not valid. This app scans EAN-8 and EAN-13.", 
                                               dismissBtutton: .default(Text("Ok")))
}

struct BarcodeScannerView: View {
    
    @State private var scannedCode = ""
    @State private var alertItem: AlertItem?
    
    var body: some View {
        NavigationView{
            VStack {
                ScannerView(scannedCode: $scannedCode, alertItem: $alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer().frame(height: 60)

                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)

                Text(scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(scannedCode.isEmpty ? .red : .green)
                    .padding()
                
                Button {

                } label: {
                    Text("Tap me")
                }
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $alertItem) { alertItem in
                Alert(title: Text(alertItem.title),
                      message: Text(alertItem.message),
                      dismissButton: alertItem.dismissBtutton)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BarcodeScannerView()
    }
}
