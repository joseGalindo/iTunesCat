//
//  CVCVideo.swift
//  iTunesCat
//
//  Created by Jose Galindo martinez on 30/04/20.
//  Copyright © 2020 JCG. All rights reserved.
//

import UIKit
import Nuke

class CVCVideo: UICollectionViewCell {

    static let REUSE_IDENTIFIER = String(describing: CVCVideo.self)
    static let CELL_HEIGHT = 160
    static let CELL_WIDTH = 150
    
    @IBOutlet weak var mDisplayImage: UIImageView!
    @IBOutlet weak var mDisplayName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func assingCatalog(_ catalogue : Catalog) {
        guard let murl = URL(string: catalogue.artworkUrl100 ?? "") else {
            return
        }
        Nuke.loadImage(with: murl, into: mDisplayImage)
    }

}
