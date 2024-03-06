//
//  CameraView.swift
//  swift+CameraCapture+Inference
//
//  Created by Salvatore Attanasio on 06/03/24.
//

import SwiftUI

struct CameraView: View {
    @ObservedObject private var handler = FrameHandler()
    
    var body: some View {
        FrameView(image: handler.frame)
            .ignoresSafeArea()
    }
}

#Preview {
    CameraView()
}
