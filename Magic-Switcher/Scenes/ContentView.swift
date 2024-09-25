//
//  ContentView.swift
//  Magic-Switcher
//
//  Created by Анастасия Кутняхова on 24.09.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var currentType: ContentType = .curiosity
    
    var body: some View {
        VStack {
            CustomNavigationBar(
                onSelect: { type in
                    currentType = type
                }
            )
            
            ZStack {
                Group {
                    switch currentType {
                    case .curiosity:
                        CardList()
                            .transition(
                                .move(edge: .leading).combined(with: .scale(0.9)).combined(with:
                                        .opacity)
                            )
                        
                    case .fun:
                        CardList()
                            .transition(
                                .move(edge: .trailing).combined(with: .scale(0.9))
                                .combined(with:
                                        .opacity)
                                
                            )
                    }
                }
                .animation(.easeInOut(duration: 0.5), value: currentType)
            }
            .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    ContentView()
}
