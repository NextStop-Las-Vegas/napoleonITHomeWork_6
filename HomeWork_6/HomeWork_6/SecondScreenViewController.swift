//
//  SecondScreenViewController.swift
//  HomeWork_6
//
//  Created by Pavel on 19.12.2020.
//

import UIKit

class SecondScreenViewController: UIViewController{
    var cellImage: UIImage?
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = cellImage
    }
    
}
