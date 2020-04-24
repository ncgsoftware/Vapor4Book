//
//  File.swift
//  
//
//  Created by Jeremy Nelson on 4/18/20.
//

import Vapor

struct AddressInput: Content {
    let street: String
    let city: String
    let zip: String
}
