//
//  ImageViewerAPIProvider.swift
//  ImageViewerCollectionView
//
//  Created by Sandeep on 29/03/21.
//

import Foundation
import Moya
enum ImageViewerAPIProvider {
    case loadImages(page : Int, limit : Int)
}

extension ImageViewerAPIProvider : TargetType {
    var baseURL: URL {
        switch self {
        
        case .loadImages(page: let page, limit: let limit):
            return URL(string: "https://picsum.photos/v2/list?page=\(page)&limit=\(limit)")!
        }
    }
    
    var path: String {
        switch  self {
        
        case .loadImages(page: _, limit: _):
            return ""
        }
    }
    
    var method: Moya.Method {
        switch  self {
        case .loadImages(page: _, limit: _):
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        
        case .loadImages(page: _, limit: _):
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
