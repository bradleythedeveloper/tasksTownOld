//
//  FocusSession.swift
//  tasksTown
//
//  Created by Bradley Austin on 01/10/2024.
//

import Foundation
import SwiftData
import SwiftUI

class FocusSession: Identifiable, Hashable {
    var id: String
    var user: User
    var task: Task
    var tag: Tag
    var duration: TimeInterval
    var date: Date
    var sessionType: FocusSessionType
    
    init(id: String = UUID().uuidString, user: User, task: Task, tag: Tag, duration: TimeInterval, date: Date, sessionType: FocusSessionType) {
        self.id = id
        self.user = user
        self.task = task
        self.tag = tag
        self.duration = duration
        self.date = date
        self.sessionType = sessionType
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(self.id)
    }
    static func ==(lhs: FocusSession, rhs: FocusSession) -> Bool {
        return lhs.id == rhs.id
    }
}

enum FocusSessionType: String, CaseIterable, Identifiable {
    case timer
    case stopwatch
    case pomodoro
    var id: Self { self }
    var name: String {rawValue.localizedCapitalized}
}
