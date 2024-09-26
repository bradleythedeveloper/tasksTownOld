//
//  AppSection.swift
//  tasksTown
//
//  Created by Bradley Austin on 25/09/2024.
//

import Foundation
import SwiftUI

enum AppSection: String, CaseIterable, Identifiable {
    case dashboard
    case journal
    case focus
    case town
    case you
    var id: Self { self }
    var name: String { rawValue.localizedCapitalized }
    var icon: String {
        switch self {
        case .dashboard:
            return "square.grid.2x2.fill"
        case .journal:
            return "book.pages.fill"
        case .focus:
            return "moon.fill"
        case .town:
            return "house.fill"
        case .you:
            return "person.fill"
        }
    }
    var tabView: any View {
        switch self {
        case .dashboard:
            return DashboardView()
        case .journal:
            return JournalView()
        case .focus:
            return FocusView()
        case .town:
            return TownView()
        case .you:
            return YouView()
        }
    }
}
