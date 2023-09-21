//
//  ImageModel.swift
//  Chapter_3-5_CoreData
//
//  Created by JeonSangHyeok on 2023/09/14.
//

import Foundation

struct ImageData: Codable {
    let url: String
}

struct ImageModel {
    let url: String
    
    init(imageData: ImageData) {
        self.url = imageData.url
    }
}
