//
//  QRScannerView.swift
//  Danous
//
//  Created by Sanjeev RM on 07/01/24.
//

import SwiftUI
import CodeScanner
import AVFoundation

struct QRScannerView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var cameraManager: CameraManager = CameraManager()
    
    @State var isFlashlightOn: Bool = false
    
    var body: some View {
        ZStack {
            CodeScannerView(codeTypes: [.qr], showViewfinder: false, isTorchOn: isFlashlightOn, completion: handleScan)
                .ignoresSafeArea()
            
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(.black.opacity(0.3))
                .mask(Window(size: CGSize(width: UIScreen.main.bounds.width - 90, height: UIScreen.main.bounds.height / 3)).fill(style: FillStyle(eoFill: true)))
                .ignoresSafeArea()
            
            VStack(spacing: 44) {
                titleAndDescription
                
                Spacer()
                
                flashLightButton
            }
            .padding(32)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white.opacity(0.1))
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .dynamicTypeSize(.xxLarge)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

extension QRScannerView {
    
    private var titleAndDescription: some View {
        VStack(spacing: 8) {
            Text("Scan QR Code")
                .font(.title.weight(.semibold))
                .foregroundColor(.white)
            Text("Scan the QR code of the account you want to pay to")
                .font(.callout)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding(.horizontal)
        }
    }
    
    private var viewFinder: some View {
        RoundedRectangle(cornerRadius: 32)
            .stroke(lineWidth: 4)
            .foregroundStyle(.accent)
            .frame(width: UIScreen.main.bounds.width - 90, height: UIScreen.main.bounds.height / 3)
    }
    
    private var flashLightButton: some View {
        Button {
            isFlashlightOn.toggle()
        } label: {
            if isFlashlightOn {
                flashlightOnSymbol
            } else {
                flashlightOffSymbol
            }
        }
    }
    
    private var flashlightOnSymbol: some View {
        ZStack {
            Circle()
                .frame(width: 80)
                .foregroundColor(.white.opacity(0.8))
            Image(systemName: "flashlight.on.fill")
                .font(.system(size: 40))
        }
    }
    
    private var flashlightOffSymbol: some View {
        ZStack {
            Circle()
                .frame(width: 80)
                .foregroundColor(.white.opacity(0.8))
            Image(systemName: "flashlight.off.fill")
                .font(.system(size: 40))
        }
    }
}

extension QRScannerView {
    
    private func handleScan(result: Result<ScanResult, ScanError>) {
        
    }
}

struct Window: Shape {
    let size: CGSize
    func path(in rect: CGRect) -> Path {
        var path = Rectangle().path(in: rect)

        let origin = CGPoint(x: rect.midX - size.width / 2, y: rect.midY - size.height / 2)
        path.addRoundedRect(in: CGRect(origin: origin, size: size), cornerRadii: .init(topLeading: 32, bottomLeading: 32, bottomTrailing: 32, topTrailing: 32))
        return path
    }
}

#Preview {
    NavigationStack {
        QRScannerView()
    }
}
