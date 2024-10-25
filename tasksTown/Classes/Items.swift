//
//  Task.swift
//  tasksTown
//
//  Created by Bradley Austin on 25/09/2024.
//

import Foundation
import SwiftData
import SwiftUI

class Task: Item {
    
}

class Event: Item {
    
}

class Link: Item {
    var url: String = ""
    var linkType: LinkType = LinkType.website
    init(name: String, dueDate: Date, color: ItemColor = .none, url: String, linkType: LinkType) {
        super.init(
            name: name,
            dueDate: dueDate,
            dateType: .due,
            color: color
        )
        self.url = url
        self.linkType = linkType
    }
}

class Photo: Item {
    var image: Image?
    init(name: String, dueDate: Date, color: ItemColor = .none, image: Image?) {
        super.init(
            name: name,
            dueDate: dueDate,
            dateType: .due,
            color: color
        )
        self.image = image
    }
}

enum LinkType: String, CaseIterable, Identifiable {
    case article
    case youtube
    case website
    var id: Self { self }
    var name: String { rawValue.localizedCapitalized }
}

