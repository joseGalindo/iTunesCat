//
//  CVCVideo.swift
//  iTunesCat
//
//  Created by Jose Galindo martinez on 30/04/20.
//  Copyright © 2020 JCG. All rights reserved.
//

import UIKit
import Nuke
import Toast_Swift

class CVCVideo: BaseCVC {

    static let REUSE_IDENTIFIER = String(describing: CVCVideo.self)
    static let CELL_HEIGHT = 180
    static let CELL_WIDTH = 150
    
    @IBOutlet weak var mDisplayImage: UIImageView!
    @IBOutlet weak var mDisplayName: UILabel!
    @IBOutlet weak var mDisplayGenre: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func assingCatalog(_ catalogue : Catalog) {
        super.assingCatalog(catalogue)
        guard let murl = URL(string: catalogue.artworkUrl100 ?? "") else {
            return
        }
        mDisplayName.text = catalogue.trackName
        mDisplayGenre.text = catalogue.primaryGenreName
        Nuke.loadImage(with: murl, into: mDisplayImage)
    }

    @IBAction func addFav(_ sender: Any) {
        super.addFavorite()
    }
}
