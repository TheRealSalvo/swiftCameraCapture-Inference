//
//  VideoInput.swift
//  AppDevelopmentWS
//
//  Created by Salvatore Attanasio on 14/11/23.
//

import SwiftUI

struct FrameView: View {
    
    var image: CGImage?
    
    private let label = Text("frame")
    
    var body: some View {
        VStack {
            if let image = image {
                Image (image, scale: 1.0, orientation: .up, label: label)
            } else {
                Color.black
            }
        }
        
    }
}

struct FrameView_Previews: PreviewProvider {
    static var previews: some View {
        FrameView()
    }
}

