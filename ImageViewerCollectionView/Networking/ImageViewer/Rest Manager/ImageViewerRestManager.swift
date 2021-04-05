//
//  ImageViewerRestManager.swift
//  ImageViewerCollectionView
//
//  Created by Sandeep on 29/03/21.
//

import Foundation

import Moya
class ImageViewerRestManager {
    static var shared : ImageViewerRestManager = ImageViewerRestManager()
    private var apiProvider = MoyaProvider<ImageViewerAPIProvider>()
    
    func loadImages(page : Int, limit : Int , handler: ((Result<ImageViewerResponse,Error>)->Void)?) {
        DispatchQueue.main.async {
            self.apiProvider.request(.loadImages(page: page, limit: limit)) { (response) in
                switch response {
                case .success(let result):
                    do{
                        let decoder = JSONDecoder()
                        let data = try decoder.decode(ImageViewerResponse.self, from: result.data)
                        handler?(.success(data))
                    }catch let error {
                        handler?(.failure(error))
                    }
                case .failure(let error):
                    handler?(.failure(error))
                }
            }
        }
    }
}
