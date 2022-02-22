//
//  Receipt.swift
//  SwiftUILearning
//
//  Created by Camilo Cabana on 2022/02/22.
//

import Foundation

struct Receipts: Codable {
    
    var receipts: [Receipt]
    
    enum CodingKeys: String, CodingKey {
        case receipts = "items"
    }
}

struct Receipt: Codable, Identifiable {
    
    var id: String
    var published: String
    var title: String
    var media: Media
    
    enum CodingKeys: String, CodingKey {
        case published
        case title
        case media
        case id = "link"
    }
}

struct Media: Codable {
    
    var image: String
    
    enum CodingKeys: String, CodingKey {
        case image = "m"
    }
}
