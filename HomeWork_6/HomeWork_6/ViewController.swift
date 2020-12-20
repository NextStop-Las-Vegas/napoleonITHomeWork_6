//
//  ViewController.swift
//  HomeWork_6
//
//  Created by Pavel on 19.12.2020.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func touchMyImage(_ sender: Any) {
        getURLs()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    var photos = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    private func getURLs(){
        photos = Array(repeating: Photo(url: "https://picsum.photos/500"), count: 30 )
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        
        cell.image.clearCache()
        cell.image.loadImage(fromURL: photos[indexPath.row].url)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ImageCollectionViewCell
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let collectionViewController = storyboard.instantiateViewController(withIdentifier: "SecondScreenViewController") as! SecondScreenViewController
        collectionViewController.cellImage = cell.image.image
        
        self.navigationController?.pushViewController(collectionViewController, animated: true)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthScreen = view.frame.width - 40
        let width = widthScreen/3
        return CGSize(width: width, height: width)
    }
}





struct Photo: Codable {
    let url: String
    var image: UIImage?
    
    init(url: String){
        self.url = url
    }
    private enum CodingKeys: String, CodingKey{
        case url = "image_url"
    }
}
