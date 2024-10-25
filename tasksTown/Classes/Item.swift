//
//  Item.swift
//  tasksTown
//
//  Created by Bradley Austin on 28/09/2024.
//

import Foundation
import SwiftData
import SwiftUI

class Item: Identifiable, Hashable {
    var id = UUID().uuidString
    var name: String
    var description = ""
    var dueDate: Date?
    var isComplete = false
    var dateType: ItemDateType
    var dateTypePrint = ""
    var color: ItemColor
    var tag: Tag?
    init(name:String,dueDate:Date,dateType:ItemDateType,color:ItemColor = .none) {
        self.name = name
        self.dueDate = dueDate
        self.dateType = dateType
        self.color = color
    }
    init(name:String,color:ItemColor = .none) {
        self.name = name
        self.dateType = .noDate
        self.dateTypePrint = "No Date"
        self.color = color
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    static func ==(lhs: Item, rhs: Item) -> Bool {
        return lhs.id == rhs.id
    }
}

enum ItemDateType: String, CaseIterable, Identifiable {
    case due = "Due"
    case completeBy = "Complete By"
    case noDate = "No Date"
    var id: Self { self }
}

enum ItemColor: String, CaseIterable, Identifiable {
    case red
    case yellow
    case green
    case none
    var id: Self { self }
    var name: String { rawValue.localizedCapitalized }
    var color: Color {
        switch self {
        case .red:
            return .red
        case .yellow:
            return .yellow
        case .green:
            return .green
        default:
            return .gray
        }
    }
    var icon: String {
            switch self {
            case .red:
                return "exclamationmark.3"
            case .yellow:
                return "exclamationmark.2"
            case .green:
                return "exclamationmark"
            default:
                return "nosign"
            }
        }
}
