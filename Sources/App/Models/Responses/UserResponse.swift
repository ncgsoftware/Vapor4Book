//
//  File.swift
//  
//
//  Created by Jeremy Nelson on 4/18/20.
//

import Vapor

struct UserResponse: Content {
    let id: Int?
    let firstName, lastname: String?
    let email: String
    let address: [AddressResponse]?
    
    
    init(user: User, addresses: [AddressResponse]? = nil) {
        self.id = user.id
        self.firstName = user.firstname
        self.lastname = user.lastname
        self.email = user.email
        self.address = addresses
    }
}
