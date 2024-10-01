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
    var linkType: LinkType = .website
}

class Photo: Item {
    var image: Image?
}

enum LinkType: String, CaseIterable, Identifiable {
    case article
    case youtube
    case website
    var id: Self { self }
    var name: String { rawValue.localizedCapitalized }
}

