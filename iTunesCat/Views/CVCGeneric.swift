//
//  CVCGeneric.swift
//  iTunesCat
//
//  Created by Jose Galindo martinez on 30/04/20.
//  Copyright © 2020 JCG. All rights reserved.
//

import UIKit
import Nuke

class CVCGeneric: UICollectionViewCell {

    static let REUSE_IDENTIFIER = String(describing: CVCGeneric.self)
    
    @IBOutlet weak var mDisplayImage: UIImageView!
    @IBOutlet weak var mDisplayName: UILabel!
    @IBOutlet weak var genre: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func assingCatalog(_ catalogue : Catalog) {
        guard let murl = URL(string: catalogue.artworkUrl60 ?? "") else {
            return
        }
        mDisplayName.text = catalogue.collectionName
        genre.text = catalogue.artistName
        Nuke.loadImage(with: murl, into: mDisplayImage)
    }
    
}
