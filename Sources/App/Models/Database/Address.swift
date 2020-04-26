//
//  File.swift
//  
//
//  Created by Jeremy Nelson on 4/16/20.
//

import Vapor
import Fluent

final class Address: Model {
    
    // Database table name
    static let schema = "addresses"
    
    
    @ID(key: "id")
    var id: Int?
    
    @Field(key: "street")
    var street: String
    
    @Field(key: "city")
    var city: String
    
    @Field(key: "zip")
    var zip: String
    
    @Field(key: "userId")
    var userId: Int
    
    @Timestamp(key: "createdAt", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "updatedAt", on: .update)
    var updatedAt: Date?
    
    @Timestamp(key: "deletedAt", on: .delete)
    var deletedAt: Date?
    
    
    init(){}
    
    init(street: String, city: String, zip: String, userId: Int){
        self.street = street
        self.city = city
        self.zip = zip
        self.userId = userId
    }
    
}
