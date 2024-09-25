//
//  ContentType.swift
//  Magic-Switcher
//
//  Created by Анастасия Кутняхова on 25.09.2024.
//

import Foundation

enum ContentType {
    case curiosity
    case fun
}

extension ContentType {
    struct Content: Identifiable {
        let id = UUID()
        let title: String
        let subtitle: String
    }

    var content: Content {
        switch self {
        case .curiosity:
            Content(
                title: "Curious mode",
                subtitle: "learning + 10% fun"
            )
        case .fun:
            Content(
                title: "Fun mode",
                subtitle: "90% fun and a little learning"
            )
        }
    }
}
