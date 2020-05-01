//
//  EntitySaved.swift
//  iTunesCat
//
//  Created by Jose Galindo martinez on 30/04/20.
//  Copyright © 2020 JCG. All rights reserved.
//

import UIKit
import RealmSwift

class EntitySaved: Object {

    @objc dynamic var wrapperType: String?
    @objc dynamic var kind: String?
    @objc dynamic var artistId: Int = 0
    @objc dynamic var collectionId: Int = 0
    @objc dynamic var trackId: Int = 0
    @objc dynamic var artistName: String?
    @objc dynamic var collectionName: String?
    @objc dynamic var trackName: String?
    @objc dynamic var collectionCensoredName: String?
    @objc dynamic var trackCensoredName: String?
    @objc dynamic var artistViewUrl: String?
    @objc dynamic var collectionViewUrl: String?
    @objc dynamic var trackViewUrl: String?
    @objc dynamic var previewUrl: String?
    @objc dynamic var artworkUrl30: String?
    @objc dynamic var artworkUrl60: String?
    @objc dynamic var artworkUrl100: String?
    @objc dynamic var collectionPrice: Double = 0.0
    @objc dynamic var trackPrice: Double = 0.0
    @objc dynamic var trackRentalPrice: Double = 0.0
    @objc dynamic var collectionHdPrice: Double = 0.0
    @objc dynamic var trackHdPrice: Double = 0.0
    @objc dynamic var trackHdRentalPrice: Double = 0.0
    @objc dynamic var releaseDate: String?
    @objc dynamic var collectionExplicitness: String?
    @objc dynamic var trackExplicitness: String?
    @objc dynamic var discCount: Int = 0
    @objc dynamic var discNumber: Int = 0
    @objc dynamic var trackCount: Int = 0
    @objc dynamic var trackNumber: Int = 0
    @objc dynamic var trackTimeMillis: Int64 = 0
    @objc dynamic var country: String?
    @objc dynamic var currency: String?
    @objc dynamic var primaryGenreName: String?
    @objc dynamic var contentAdvisoryRating: String?
    @objc dynamic var shortDescription: String?
    @objc dynamic var longDescription: String?
    @objc dynamic var isStreamable: Bool = false
    @objc dynamic var hasITunesExtras: Bool = false
    
    override static func primaryKey() -> String? {
        return "artistId"
    }
}
