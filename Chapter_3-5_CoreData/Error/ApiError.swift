//
//  ApiError.swift
//  Chapter_3-5_CoreData
//
//  Created by JeonSangHyeok on 2023/09/14.
//

import Foundation

enum ApiError: Error {
    case invalidURL
    case failDataTask
    case noData
    case failParshing
}
