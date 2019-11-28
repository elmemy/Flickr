//
//  PhotosViewController.swift
//  Flickr
//
//  Created by ahmed elmemy on 11/27/19.
//  Copyright © 2019 ElMeMy. All rights reserved.
//

import UIKit
import Alamofire
class PhotosViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var Photos : PhotoModel?
    var itemData = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        PhotService()
    }
    
    
    
    func PhotService() {
        
        
        let url = "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=f04408eca8a1ce093f71b06daf397c0a"
        
        
        let body = [
            
            "tags" : "animal",
            ";tagmode" : "any",
            "format" : "json",
            "nojsoncallback" : "1&fbclid=IwAR0lz2tQk5W4VJiXZiBSXZngOsTqvyzK6QqnR42mlyp9fUkticUanKOT01E",
            ] as [String:Any]
        
        
        Alamofire.request(url, method: .get, parameters: body,encoding: URLEncoding.default).responseJSON { (response) in
            switch response.result{
                
            case .success(_):
                
                do{
                    let data = try JSONDecoder().decode(PhotoModel.self, from: response.data!)
                    self.Photos = data
                    self.handeleViewData(PhotosData: data)
                    self.collectionView.reloadData()
                }catch{
                    
                }
                
            case .failure(_):
                break
            }
        }
    }
    
    func handeleViewData(PhotosData: PhotoModel){
        
        self.itemData  = PhotosData.photos.photo
    }
    
    @IBAction func SearchPressed(_ sender: Any) {
        
        let vc = Storyboard.Main.instantiate(ResultSearchViewController.self)
        vc.text = searchTextField.text
        present(vc,animated: true,completion: nil)
    }
}
extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.itemData.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCell else {return  UICollectionViewCell()}
        let Call = self.itemData[indexPath.row]
        cell.configureCell(item: Call)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (collectionView.bounds.width/2) - 20.0 , height: 200)
        
    }
    
    
}
