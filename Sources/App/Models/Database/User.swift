//
//  File.swift
//  
//
//  Created by Jeremy Nelson on 4/16/20.
//

import Vapor
import Fluent

final class User: Model {
    
    // Database table name
    static let schema = "users"
    
    
    @ID(key: "id")
    var id: Int?
    
    @Field(key: "firstname")
    var firstname: String?
    
    @Field(key: "lastname")
    var lastname: String?
    
    @Field(key: "email")
    var email: String
    
    @Field(key: "password")
    var password: String
    
    @Timestamp(key: "createdAt", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "updatedAt", on: .update)
    var updatedAt: Date?
    
    @Timestamp(key: "deletedAt", on: .delete)
    var deletedAt: Date?
    
    init(){}

    init(_ email:String, _ firstName: String? = nil, _ lastname: String? = nil, _ password: String) throws {
        self.email = email
        self.firstname = firstName
        self.lastname = lastname
        self.password = try BCryptDigest().hash(password)
    }
}
