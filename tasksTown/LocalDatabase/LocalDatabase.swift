//
//  LocalDatabase.swift
//  tasksTown
//
//  Created by Bradley Austin on 22/10/2024.
//

import Foundation
import GRDB

struct LocalDatabase {

    private let writer: DatabaseWriter

    init(_ writer: DatabaseWriter) throws {
        self.writer = writer
        try migrator.migrate(writer)
    }

    var reader: DatabaseReader {
        writer
    }
}
