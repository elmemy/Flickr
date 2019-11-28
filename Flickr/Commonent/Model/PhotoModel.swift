//
//  PhotoModel.swift
//  Flickr
//
//  Created by ahmed elmemy on 11/27/19.
//  Copyright © 2019 ElMeMy. All rights reserved.
//

import Foundation

// MARK: - PhotoModel
struct PhotoModel: Codable {
    let photos: Photos
    let stat: String
}

// MARK: - Photos
struct Photos: Codable {
    let page, pages, perpage: Int
    let total: String
    let photo: [Photo]
}

// MARK: - Photo
struct Photo: Codable {
    let id, owner, secret, server: String
    let farm: Int
    let title: String
    let ispublic, isfriend, isfamily: Int
}
