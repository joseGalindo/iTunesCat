//
//  BaseCVC.swift
//  iTunesCat
//
//  Created by Jose Galindo martinez on 01/05/20.
//  Copyright © 2020 JCG. All rights reserved.
//

import UIKit

class BaseCVC: UICollectionViewCell {
    
    var mcat : Catalog!
    weak var father : UIViewController?
    
    func assingCatalog(_ catalogue : Catalog) {
        mcat = catalogue
    }
    func addFavorite() {
        if (father != nil)  && ManageDatabase.sharedInstance.addCatalogue(mcat){
            father!.view.makeToast("Added to Favs")
        }
    }
}
