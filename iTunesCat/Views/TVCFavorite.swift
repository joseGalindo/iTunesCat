//
//  TVCFavorite.swift
//  iTunesCat
//
//  Created by Jose Galindo martinez on 01/05/20.
//  Copyright © 2020 JCG. All rights reserved.
//

import UIKit
import Nuke

class TVCFavorite: UITableViewCell {

    @IBOutlet weak var mDisplayName: UILabel!
    @IBOutlet weak var mDisplayType: UILabel!
    @IBOutlet weak var mDisplayGenre: UILabel!
    @IBOutlet weak var mDisplayImage: UIImageView!

    static let REUSE_IDENTIFIER = String(describing: TVCFavorite.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(_ fav : EntitySaved) {
        mDisplayName.text = fav.trackName ?? fav.collectionName
        mDisplayType.text = fav.kind ?? fav.wrapperType
        mDisplayGenre.text = fav.primaryGenreName
        
        guard let murl = URL(string: fav.artworkUrl60 ?? "") else {
            return
        }
        Nuke.loadImage(with: murl, into: mDisplayImage)
    }
    
}
