//
//  ConnectedAccount.swift
//  tasksTown
//
//  Created by Bradley Austin on 21/10/2024.
//

import Foundation
import SwiftUI
import SwiftData

class ConnectedAccount: Identifiable {
    var id = UUID().uuidString
    var user: User
    var token: String
    init(user: User, token: String) {
        self.user = user
        self.token = token
    }
}
