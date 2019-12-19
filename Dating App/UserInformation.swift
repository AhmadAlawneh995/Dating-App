//
//  UserInformation.swift
//  Dating App
//
//  Created by Ahmad Alawneh on 12/19/19.
//  Copyright © 2019 Ahmad Alawneh. All rights reserved.
//

import Foundation

// MARK: - UserInformation
struct UserInformation: Codable {
    let name: String?
    let activeEnabled: Bool?
    let activeState, activePercentage, about, gender: String?
    let interest: [Interest]?
    let images: [Image]?

    enum CodingKeys: String, CodingKey {
        case name
        case activeEnabled = "active_enabled"
        case activeState = "active_state"
        case activePercentage = "active_percentage"
        case about, gender, interest, images
    }
}

// MARK: - Image
struct Image: Codable {
    let imageName: String?

    enum CodingKeys: String, CodingKey {
        case imageName = "image_name"
    }
}

// MARK: - Interest
struct Interest: Codable {
    let interestTitle: String?

    enum CodingKeys: String, CodingKey {
        case interestTitle = "interest_title"
    }
}
