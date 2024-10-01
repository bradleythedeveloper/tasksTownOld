//
//  User.swift
//  tasksTown
//
//  Created by Bradley Austin on 01/10/2024.
//

import Foundation
import SwiftData
import SwiftUI

class User: Identifiable, Hashable {
    var id: String
    var username: String
    var firstName: String
    var lastName: String
    var email: String
    var password: String
//    let createdAt: Date
//    let updatedAt: Date
    init (id: String, username: String, firstName: String, lastName: String, email: String, password: String) {
        self.id = id
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        
    }
    func hash(into hasher: inout Hasher) {
            hasher.combine(self.id)
    }
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}
