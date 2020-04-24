//
//  File.swift
//  
//
//  Created by Jeremy Nelson on 4/16/20.
//

import Fluent

struct CreateUser: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("users")
            //.id()
            .field("id", .int, .identifier(auto: true))
            .field("firstname", .string)
            .field("lastname", .string)
            .field("email", .string, .required)
            .field("password", .string, .required)
            .field("createdAt", .datetime)
            .field("updatedAt", .datetime)
            .field("deletedAt", .datetime)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("users").delete()
    }
    
}
