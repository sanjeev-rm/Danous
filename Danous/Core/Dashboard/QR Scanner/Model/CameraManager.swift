//
//  CameraManager.swift
//  Danous
//
//  Created by Sanjeev RM on 07/01/24.
//

import Foundation
import AVFoundation

class CameraManager: ObservableObject {
    @Published var permissionGranted: Bool = false
    
    init() {
        checkAndRequestPermission()
    }
    
    func requestPermission() {
        AVCaptureDevice.requestAccess(for: .video) { accessGranted in
            DispatchQueue.main.async {
                self.permissionGranted = accessGranted
            }
        }
    }
    
    func checkAndRequestPermission() {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        
        switch status {
        case .authorized:
            permissionGranted = true
        case .notDetermined:
            permissionGranted = false
            requestPermission()
        case .restricted:
            print("DEBUG: Device Owner must approve")
            permissionGranted = false
            requestPermission()
        case .denied:
            print("DEBUG: Enable camera access from settings")
            permissionGranted = false
        @unknown default:
            print("DEBUG: unknown camera access error before scanning")
            permissionGranted = false
        }
    }
}
