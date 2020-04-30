//
//  CVCSong.swift
//  iTunesCat
//
//  Created by Jose Galindo martinez on 29/04/20.
//  Copyright © 2020 JCG. All rights reserved.
//

import UIKit
import Nuke

class CVCSong: UICollectionViewCell {

    static let REUSE_IDENTIFIER = String(describing: CVCSong.self)
    static let CELL_HEIGHT = 80
    
    @IBOutlet weak var mDisplayImage: UIImageView!
    @IBOutlet weak var mDisplayName: UILabel!
    @IBOutlet weak var mDisplayInfo: UILabel!
    @IBOutlet weak var mDisplayGenre: UILabel!
    
    let cell_type = MEDIA_TYPE.SONG
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func assingCatalog(_ catalogue : Catalog) {
        guard let murl = URL(string: catalogue.artworkUrl30 ?? "") else {
            return
        }
        Nuke.loadImage(with: murl, into: mDisplayImage)
        mDisplayName.text = catalogue.trackName
        mDisplayInfo.text = "\(catalogue.collectionName ?? "") \(catalogue.artistName ?? "")"
        mDisplayGenre.text = catalogue.primaryGenreName
    }
    
    @IBAction func playPreview(_ sender: Any) {
    }
    
    
}
