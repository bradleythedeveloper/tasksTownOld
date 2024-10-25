//
//  Building.swift
//  tasksTown
//
//  Created by Bradley Austin on 21/10/2024.
//

import Foundation
import SwiftUI
import SwiftData

class Building: Identifiable {
    var id = UUID().uuidString
    var name: String
    var buildingType: BuildingType
    var position: Int
    init(id: String = UUID().uuidString, name: String, buildingType: BuildingType, position: Int) {
        self.id = id
        self.name = name
        self.buildingType = buildingType
        self.position = position
    }
}

enum BuildingType: String, CaseIterable {
    case house
    case musicStore
}
