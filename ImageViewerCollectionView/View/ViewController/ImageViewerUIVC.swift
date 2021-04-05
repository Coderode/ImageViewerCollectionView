//
//  ImageViewerUIVC.swift
//  ImageViewerCollectionView
//
//  Created by Sandeep on 29/03/21.
//
import UIKit
import PinterestLayout
protocol ImageViewerUIVCDataSource : class {
    var dataSet : [ImageViewerResponseElement] { get }
}

protocol ImageViewerUIVCDelegate : class {
    func loadMoreData(at page : Int)
}

protocol ImageViewerUIVC {
    var view : ImageViewerView! { get set }
    func setUI()
}

class CollectionViewImageViewerUIVC: NSObject,ImageViewerUIVC {
    var view : ImageViewerView! {
        didSet {
            setUI()
        }
    }
    func setUI(){
        let layout = PinterestLayout()
        layout.delegate = self
        layout.cellPadding = 0
        layout.numberOfColumns = 3
        
        view.collectionView.collectionViewLayout = layout
        view.collectionView.delegate = self
        view.collectionView.dataSource = self
        view.loadMoreData(at: 0)
        view.collectionView.register(UINib(nibName: "ImageViewerCell", bundle: .main), forCellWithReuseIdentifier: "ImageViewerCell")
    }
}
extension CollectionViewImageViewerUIVC : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        view.dataSet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = view.collectionView.dequeueReusableCell(withReuseIdentifier: "ImageViewerCell", for: indexPath) as! ImageViewerCell
        cell.setData(imageURL: view.dataSet[indexPath.row].downloadURL)
        //cell.frame.size.height = 200
        cell.frame.size.width = view.collectionView.frame.size.width / 3
        return cell
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        view.loadMoreData(at: view.page)
    }
}

extension CollectionViewImageViewerUIVC : PinterestLayoutDelegate {
    func collectionView(collectionView: UICollectionView, heightForImageAtIndexPath indexPath: IndexPath, withWidth: CGFloat) -> CGFloat {
        return 100
    }
    
    func collectionView(collectionView: UICollectionView, heightForAnnotationAtIndexPath indexPath: IndexPath, withWidth: CGFloat) -> CGFloat {
        return 0
    }
}
