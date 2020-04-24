//
//  File.swift
//  
//
//  Created by Jeremy Nelson on 4/18/20.
//

import Vapor

struct RefreshTokenInput: Content {
    let refreshToken: String
}
