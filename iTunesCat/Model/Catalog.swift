//
//  Catalog.swift
//  iTunesCat
//
//  Created by Jose Galindo martinez on 29/04/20.
//  Copyright © 2020 JCG. All rights reserved.
//

import UIKit
import ObjectMapper

enum MEDIA_TYPE {
    case BOOK
    case ALBUM
    case COACHED_AUDIO
    case MUSIC_VIDEO
    case ARTIST
    case SONG
    case FEATURE_MOVIE
    case TV_EPISODE
    case SOFTWARE_PACKAGE
    case PODCAST_EPISODE
    case PDF_PODCAST
    case INTERACTIVE_BOOKLET
}

class Catalog: Entity, Mappable {

    var wrapperType: String?
    var kind: String?
    var artistId: Int = 0
    var collectionId: Int = 0
    var trackId: Int = 0
    var artistName: String?
    var collectionName: String?
    var trackName: String?
    var collectionCensoredName: String?
    var trackCensoredName: String?
    var artistViewUrl: String?
    var collectionViewUrl: String?
    var trackViewUrl: String?
    var previewUrl: String?
    var artworkUrl30: String?
    var artworkUrl60: String?
    var artworkUrl100: String?
    var collectionPrice: Double?
    var trackPrice: Double?
    var trackRentalPrice: Double?
    var collectionHdPrice: Double?
    var trackHdPrice: Double?
    var trackHdRentalPrice: Double?
    var releaseDate: String?
    var collectionExplicitness: String?
    var trackExplicitness: String?
    var discCount: Int = 0
    var discNumber: Int = 0
    var trackCount: Int = 0
    var trackNumber: Int = 0
    var trackTimeMillis: Int64 = 0
    var country: String?
    var currency: String?
    var primaryGenreName: String?
    var contentAdvisoryRating: String?
    var shortDescription: String?
    var longDescription: String?
    var isStreamable: Bool = false
    var hasITunesExtras: Bool = false
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        
    }
    
}
