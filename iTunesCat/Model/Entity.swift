//
//  Entity.swift
//  iTunesCat
//
//  Created by Jose Galindo martinez on 29/04/20.
//  Copyright © 2020 JCG. All rights reserved.
//

import Foundation


protocol Entity {
    
    var wrapperType : String? {get set}
    var kind : String? {get set}   // sobre este
    var artistId : Int {get set}
    var collectionId : Int {get set}
    var trackId : Int {get set}
    var artistName : String? {get set}
    var collectionName : String? {get set}
    var trackName : String? {get set}
    var collectionCensoredName : String? {get set}
    var trackCensoredName : String? {get set}
    var artistViewUrl : String? {get set}
    var collectionViewUrl : String? {get set}
    var trackViewUrl : String? {get set}
    var previewUrl : String? {get set}
    var artworkUrl30 : String? {get set}
    var artworkUrl60 : String? {get set}
    var artworkUrl100 : String? {get set}
    var collectionPrice : Double? {get set}
    var trackPrice : Double? {get set}
    var trackRentalPrice : Double? {get set}
    var collectionHdPrice : Double? {get set}
    var trackHdPrice : Double? {get set}
    var trackHdRentalPrice : Double? {get set}
    var releaseDate : String? {get set}
    var collectionExplicitness : String? {get set}
    var trackExplicitness : String? {get set}
    var discCount : Int {get set}
    var discNumber : Int {get set}
    var trackCount : Int {get set}
    var trackNumber : Int {get set}
    var trackTimeMillis : Int64 {get set}
    var country : String? {get set}
    var currency : String? {get set}
    var primaryGenreName : String? {get set}
    var contentAdvisoryRating : String? {get set}
    var shortDescription : String? {get set}
    var longDescription : String? {get set}
    var isStreamable : Bool {get set}
    var hasITunesExtras : Bool {get set}
}

