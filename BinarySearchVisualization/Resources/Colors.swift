//
//  Colors.swift
//  BinarySearchVisualization
//
//  Created by Артем Солодовников on 27.05.2025.
//

import SwiftUI

enum NumberColor: CaseIterable {
    case blue
    case green
    case yellow
    case orange
    case red
    
    var value: Color {
        switch self {
        case .blue: return Color(hex: "#26C6DA")
        case .green: return Color(hex: "#9CCC65")
        case .yellow: return Color(hex: "#FFEE58")
        case .orange: return Color(hex: "#FFA726")
        case .red: return Color(hex: "#FF7043")
        }
    }
}
