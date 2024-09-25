//
//  CardList.swift
//  Magic-Switcher
//
//  Created by Анастасия Кутняхова on 24.09.2024.
//

import SwiftUI

struct CardList: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                ForEach(0..<10) { view in
                    VideoCardView()
                }
            }
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 30, trailing: 16))
        }
    }
}

struct VideoCardView: View {
    let primaryColor = Color(.init(gray: 0.9, alpha: 1.0))
    let secondaryColor  = Color(.init(gray: 0.8, alpha: 1.0))
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            secondaryColor
                .frame(width: 116, height: 116)
            
            VStack(alignment: .leading, spacing: 6) {
                secondaryColor
                    .frame(height: 20)
                
                primaryColor
                    .frame(height: 20)
                
                primaryColor
                    .frame(width: 94, height: 15)
            }
        }
        .padding()
        .blinking(duration: 0.75)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 8, y: 6)
    }
}

#Preview {
    CardList()
}
