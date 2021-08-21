//
//  Alert.swift
//  BarcodeScanner
//
//  Created by RaulF on 21/8/21.
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
