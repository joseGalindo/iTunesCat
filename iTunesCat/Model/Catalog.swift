//
//  Catalog.swift
//  iTunesCat
//
//  Created by Jose Galindo martinez on 29/04/20.
//  Copyright © 2020 JCG. All rights reserved.
//

import UIKit
import ObjectMapper

enum MEDIA_TYPE : String {
    case BOOK = "book"
    case ALBUM = "album"
    case COACHED_AUDIO = "coached-audio"
    case MUSIC_VIDEO = "music-video"
    case ARTIST = "artist"
    case SONG = "song"
    case FEATURE_MOVIE = "feature-movie"
    case TV_EPISODE = "tv-episode"
    case SOFTWARE_PACKAGE = "software-package"
    case PODCAST_EPISODE = "podcast-episode"
    case PDF_PODCAST = "pdf-podcast"
    case INTERACTIVE_BOOKLET = "interactive-booklet"
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
    
    //
    var mediaType : MEDIA_TYPE!
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        wrapperType <- map ["wrapperType"]
        kind        <- map ["kind"]
        artistId    <- map["artistId"]
        collectionId <- map["collectionId"]
        trackId      <- map["trackId"]
        artistName   <- map["artistName"]
        collectionName  <- map["collectionName"]
        trackName       <- map["trackName"]
        collectionCensoredName <- map["collectionCensoredName"]
        trackCensoredName <- map["trackCensoredName"]
        artistViewUrl     <- map["artistViewUrl"]
        collectionViewUrl <- map["collectionViewUrl"]
        trackViewUrl      <- map["trackViewUrl"]
        previewUrl        <- map["previewUrl"]
        artworkUrl30      <- map["artworkUrl30"]
        artworkUrl60      <- map["artworkUrl60"]
        artworkUrl100     <- map["artworkUrl100"]
        collectionPrice   <- map["collectionPrice"]
        trackPrice        <- map["trackPrice"]
        trackRentalPrice  <- map["trackRentalPrice"]
        collectionHdPrice <- map["collectionHdPrice"]
        trackHdPrice      <- map["trackHdPrice"]
        trackHdRentalPrice <- map["trackHdRentalPrice"]
        releaseDate        <- map["releaseDate"] // yyyy-MM-ddTHH:mm:ssZ
        collectionExplicitness <- map["collectionExplicitness"]
        trackExplicitness   <- map["trackExplicitness"]
        discCount           <- map["discCount"]
        discNumber          <- map["discNumber"]
        trackCount          <- map["trackCount"]
        trackNumber         <- map["trackNumber"]
        trackTimeMillis     <- map["trackTimeMillis"]
        country             <- map["country"]
        currency            <- map["currency"]
        primaryGenreName    <- map["primaryGenreName"]
        contentAdvisoryRating <- map["contentAdvisoryRating"]
        shortDescription     <- map["shortDescription"]
        longDescription      <- map["longDescription"]
        isStreamable         <- map["isStreamable"]
        hasITunesExtras      <- map["hasITunesExtras"]
        self.setMediaType()
    }
    
    
    private func setMediaType() {
        if kind == "song" { self.mediaType = .SONG }
        if kind == "book" { self.mediaType = .BOOK }
        if kind == "album" { self.mediaType = .ALBUM }
        if kind == "coached-audio" { self.mediaType = .COACHED_AUDIO }
        if kind == "feature-movie" { self.mediaType = .FEATURE_MOVIE }
        if kind == "interactive-booklet" { self.mediaType = .INTERACTIVE_BOOKLET }
        if kind == "music-video" { self.mediaType = .MUSIC_VIDEO }
        if kind == "pdf podcast" { self.mediaType = .PDF_PODCAST }
        if kind == "podcast-episode" { self.mediaType = .PODCAST_EPISODE }
        if kind == "software-package" { self.mediaType = .SOFTWARE_PACKAGE }
        if kind == "tv-episode" { self.mediaType = .TV_EPISODE }
        if kind == "artist" { self.mediaType = .ARTIST }
    }
    
    func createSaveObject() -> EntitySaved {
        let entity = EntitySaved()
        entity.wrapperType = wrapperType
        entity.kind = kind
        entity.artistId = artistId
        entity.collectionId = collectionId
        entity.trackId = trackId
        entity.artistName = artistName
        entity.collectionName = collectionName
        entity.trackName = trackName
        entity.collectionCensoredName = collectionCensoredName
        entity.trackCensoredName = trackCensoredName
        entity.artistViewUrl = artistViewUrl
        entity.collectionViewUrl = collectionViewUrl
        entity.trackViewUrl = trackViewUrl
        entity.previewUrl = previewUrl
        entity.artworkUrl30 = artworkUrl30
        entity.artworkUrl60 = artworkUrl60
        entity.artworkUrl100 = artworkUrl100
        entity.collectionPrice = collectionPrice ?? 0
        entity.trackPrice = trackPrice ?? 0
        entity.releaseDate = releaseDate
        entity.collectionExplicitness = collectionExplicitness
        entity.trackExplicitness = trackExplicitness
        entity.discCount = discCount
        entity.discNumber = discNumber
        entity.trackCount = trackCount
        entity.trackTimeMillis = trackTimeMillis
        entity.country = country
        entity.currency = currency
        entity.primaryGenreName = primaryGenreName
        return entity
    }
}
