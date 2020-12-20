//
//  ImageCollectionViewCell.swift
//  HomeWork_6
//
//  Created by Pavel on 19.12.2020.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell{
    @IBOutlet weak var image: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = UIImage(named: "place")
    }
}

