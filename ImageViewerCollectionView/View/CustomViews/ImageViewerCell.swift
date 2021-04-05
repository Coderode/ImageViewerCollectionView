//
//  ImageViewerCell.swift
//  ImageViewerCollectionView
//
//  Created by Sandeep on 29/03/21.
//

import UIKit

class ImageViewerCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    override func awakeFromNib() {
        super.awakeFromNib()
        //indicator.isHidden = false
    }
    func setData(imageURL : String){
        imageView.imageFromUrl(urlString: imageURL) { (result) in
            if result {
                self.indicator.isHidden = true
            }
        }
    }
}
