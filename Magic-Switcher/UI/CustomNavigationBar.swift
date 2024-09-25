//
//  CustomNavigationBar.swift
//  Magic-Switcher
//
//  Created by Анастасия Кутняхова on 24.09.2024.
//

import SwiftUI

struct CustomNavigationBar: View {
    @State private var isContentSwitcherOpen: Bool = false
    @State private var selectedType: ContentType = .curiosity

    let onSelect: (ContentType) -> Void

    private let items: [ContentType] = [.curiosity, .fun]

    var body: some View {
        VStack {
            HStack {
                SwitchButton(
                    isContentSwitcherOpen: $isContentSwitcherOpen,
                    selectedType: $selectedType
                )

                Spacer()

                TimerLabel()
            }
            .padding()
            .foregroundStyle(.white)
            .background(Color.black)
        }

        if isContentSwitcherOpen {
            VStack(spacing: 0) {
                ForEach(items, id: \.self) { item in
                    ModeButton(
                        isContentSwitcherOpen: $isContentSwitcherOpen,
                        selectedType: $selectedType,
                        item: item,
                        onSelect: onSelect
                    )
                }
            }
        }
    }
}

private struct DisplayItem: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundStyle(.black)
                
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
        }
    }
}

private struct SwitchButton: View {
    @Binding var isContentSwitcherOpen: Bool
    @Binding var selectedType: ContentType

    var body: some View {
        Button(
            action: {
                withAnimation {
                    isContentSwitcherOpen.toggle()
                }
            },
            label: {
                HStack {
                    Text(selectedType.content.title)
                    
                    Image(
                        systemName: isContentSwitcherOpen ? "chevron.up" : "chevron.down"
                    )
                    .foregroundColor(.white)
                }
            }
        )
    }
}

private struct ModeButton: View {
    @Binding var isContentSwitcherOpen: Bool
    @Binding var selectedType: ContentType

    let item: ContentType
    let onSelect: (ContentType) -> Void

    var body: some View {
        Button(
            action: {
                withAnimation {
                    selectedType = item
                    isContentSwitcherOpen = false
                    onSelect(item)
                }
            },
            label: {
                HStack {
                    DisplayItem(
                        title: item.content.title,
                        subtitle: item.content.subtitle
                    )

                    Spacer()
                }
                .padding(EdgeInsets(top: 4, leading: 16, bottom: 8, trailing: 16))
            }
        )
        .buttonStyle(PlainButtonStyle())
        .background(Color.clear)
    }
}

#Preview {
    CustomNavigationBar(
        onSelect: { type in
            print(type.content.title)
        }
    )
}

struct TimerLabel: View {
    var body: some View {
        HStack(alignment: .center, spacing: 2) {
            Image(systemName: "hourglass.bottomhalf.filled")
            Text("38 min left")
                
        }
        .font(.footnote)
        .padding(.horizontal, 5)
        .padding(.vertical, 3)
        .background(
            RoundedRectangle(cornerRadius: 18)
                .stroke(lineWidth: 1)
        )
        .frame(height: 2)
    }
}
