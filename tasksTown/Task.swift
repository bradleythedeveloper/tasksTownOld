//
//  Task.swift
//  tasksTown
//
//  Created by Bradley Austin on 25/09/2024.
//

import Foundation
import SwiftData
import SwiftUI

class Task: Identifiable, Hashable {
    var name: String
    var dueDate: Date?
    var id = UUID().uuidString
    var isComplete = false
    var isFocused = false
    var dateType: TaskDateType
    var dateTypePrint = ""
    var color: TaskColor
    var tag: Tag?
    init(name:String,dueDate:Date,dateType:TaskDateType,color:TaskColor = .none) {
        self.name = name
        self.dueDate = dueDate
        self.dateType = dateType
        self.color = color
    }
    init(name:String,taskColour:TaskColor = .none) {
        self.name = name
        self.dateType = .noDate
        self.dateTypePrint = "No Date"
        self.color = taskColour
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    static func ==(lhs: Task, rhs: Task) -> Bool {
        return lhs.id == rhs.id
    }
}

enum TaskDateType: String {
    case due = "Due"
    case completeBy = "Complete By"
    case noDate = "No Date"
}

enum TaskColor: String, CaseIterable, Identifiable {
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
