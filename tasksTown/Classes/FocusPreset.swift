//
//  FocusPreset.swift
//  tasksTown
//
//  Created by Bradley Austin on 01/10/2024.
//

import Foundation
import SwiftUI
import SwiftData

class FocusPreset: Identifiable, Hashable {
    var id: String
    var user: User
    var tag: Tag
    var name: String
    var duration: TimeInterval
    var sessionType: FocusSessionType
    var blockedApps: [BlockedApp] = []
    
    init(id: String, user: User, tag: Tag, name: String, duration: TimeInterval, sessionType: FocusSessionType) {
        self.id = id
        self.user = user
        self.tag = tag
        self.name = name
        self.duration = duration
        self.sessionType = sessionType
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    static func ==(lhs: FocusPreset, rhs: FocusPreset) -> Bool {
        return lhs.id == rhs.id
    }
}

class BlockedApp: Identifiable, Hashable {
    var id: String
    var name: String
    var bundleId: String
    init(id: String, name: String, bundleId: String) {
        self.id = id
        self.name = name
        self.bundleId = bundleId
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    static func ==(lhs: BlockedApp, rhs: BlockedApp) -> Bool {
        return lhs.id == rhs.id
    }
}
