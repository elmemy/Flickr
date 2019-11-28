//
//  Language.swift
//  Flickr
//
//  Created by ahmed elmemy on 11/28/19.
//  Copyright © 2019 ElMeMy. All rights reserved.
//
import Foundation

class Language {
    class func currentLanguage() -> String {
        let def = UserDefaults.standard
        let langs = def.object(forKey: "AppleLanguages") as! NSArray
        let firstLang = langs.firstObject as! String
        
        return firstLang
    }
    
    class func setAppLanguage(lang: String) {
        let def = UserDefaults.standard
        def.set([lang, currentLanguage()], forKey: "AppleLanguages")
        def.synchronize()
        
    }
    
}
