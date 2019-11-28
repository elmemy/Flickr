//
//  PhotoCell.swift
//  Flickr
//
//  Created by ahmed elmemy on 11/27/19.
//  Copyright © 2019 ElMeMy. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    @IBOutlet weak var imgageName: UIImageView!
    @IBOutlet weak var title: UITextView!
    
    
    
    func configureCell(item: Photo){
        
        
        let imageURL = "https://farm\(item.farm).staticflickr.com/\(item.server)/\(item.id)_\(item.secret).jpg"
        
        
        imgageName.setImageWith(imageURL.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed))
        title.text = item.title
    }
}
