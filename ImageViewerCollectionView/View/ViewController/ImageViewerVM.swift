//
//  ImageViewerVM.swift
//  ImageViewerCollectionView
//
//  Created by Sandeep on 29/03/21.
//

import UIKit
protocol ImageViewerVMDataSource : class{
    var page : Int { get }
    var limit : Int { get }
}
protocol ImageViewerVMDelegate : class {
    func didLoadData(currentData : [ImageViewerResponseElement])
}
protocol ImageViewerVM {
    var view  : ImageViewerView! { get set }
    func loadImages()
}
class CollectionViewImageViewerVM: NSObject,ImageViewerVM {
    weak var view : ImageViewerView!
    
    func loadImages() {
        var currentData  = [ImageViewerResponseElement]()
        ImageViewerRestManager.shared.loadImages(page: view.page, limit: view.limit) { (response) in
            switch response {
            case .success(let result):
                for element in result {
                    currentData.append(element)
                }
                self.view.didLoadData(currentData: currentData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
