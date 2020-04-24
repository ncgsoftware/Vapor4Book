//
//  File.swift
//  
//
//  Created by Jeremy Nelson on 4/18/20.
//

import Vapor

struct RefreshTokenResponse: Content {
    let status = "success"
    let accessToken: String
}
