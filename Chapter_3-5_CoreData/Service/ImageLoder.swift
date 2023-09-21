//
//  ImageLoder.swift
//  Chapter_3-5_CoreData
//
//  Created by JeonSangHyeok on 2023/09/14.
//

import Foundation
import UIKit

struct ImageLoder {
    func loadImage(urlString: String, completion: @escaping (Result<UIImage, ApiError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completion(.failure(.failDataTask))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            guard let image = UIImage(data: data) else {
                completion(.failure(.failParshing))
                return
            }
            
            completion(.success(image))
        }
        task.resume()
    }
    
    func loadUrlImage(urlString: String, completion: @escaping (Result<ImageModel, ApiError>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else {
                completion(.failure(.failDataTask))
                return
            }
            
            guard let data else {
                completion(.failure(.noData))
                return
            }
            
            self.parseJSON(data) { result in
                switch result {
                case .failure(let error):
                    completion(.failure(error))
                case .success(let imageModel):
                    completion(.success(imageModel))
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(_ imageData: Data, completion: @escaping (Result<ImageModel, ApiError>) -> Void) {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode([ImageData].self, from: imageData)
            if let imageData = decodedData.first {
                let imageModel = ImageModel(imageData: imageData)
                completion(.success(imageModel))
            } else {
                completion(.failure(.failParshing))
            }
        } catch {
            completion(.failure(.failParshing))
            return
        }
    }
}
