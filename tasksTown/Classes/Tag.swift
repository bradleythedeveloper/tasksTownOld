//
//  Tag.swift
//  tasksTown
//
//  Created by Bradley Austin on 01/10/2024.
//

import Foundation
import SwiftUI
import SwiftData

class Tag: Identifiable, Hashable {
    var name: String
    var id: String
    var color: Color
    var isEditing = false
    init(name: String, id: String = UUID().uuidString, color: Color = Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))) {
        self.name = name
        self.id = id
        self.color = color
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    static func == (lhs: Tag, rhs: Tag) -> Bool {
        return lhs.id == rhs.id
    }
}
