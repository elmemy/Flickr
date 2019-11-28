//
//  UIImageView.swift
//  Flickr
//
//  Created by ahmed elmemy on 11/27/19.
//  Copyright © 2019 ElMeMy. All rights reserved.
//


import UIKit
import Kingfisher

extension UIImageView {
    
    func setImageWith(_ linkString: String?)  {
        guard let linkString = linkString,
            let url = URL(string: linkString) else { return }
        self.kf.setImage(with: url)
    }
    
    func setImageWith(url: URL?) {
        guard let url = url else { return  }
        self.kf.setImage(with: url)
    }
}
