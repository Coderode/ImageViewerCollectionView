//
//  ViewController.swift
//  ImageViewerCollectionView
//
//  Created by Sandeep on 26/03/21.
//

import UIKit

protocol ImageViewerView : ImageViewerVMDataSource,ImageViewerVMDelegate,ImageViewerUIVCDataSource,ImageViewerUIVCDelegate {
    var collectionView : UICollectionView! { get }
}

class ImageViewerVC : UIViewController,ImageViewerView {
    @IBOutlet weak var collectionView: UICollectionView!
    var limit : Int = 20
    var page : Int = 0
    var dataSet = [ImageViewerResponseElement]()
    
    var imageViewerVM : ImageViewerVM!
    var imageViewerUIVC : ImageViewerUIVC!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func didLoadData(currentData: [ImageViewerResponseElement]) {
        self.dataSet.append(contentsOf: currentData)
        self.collectionView.reloadData()
    }
    
    func loadMoreData(at page: Int) {
        self.page = self.page+1
        imageViewerVM.loadImages()
    }
}

