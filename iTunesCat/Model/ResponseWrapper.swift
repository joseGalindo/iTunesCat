//
//  ResponseWrapper.swift
//  iTunesCat
//
//  Created by Jose Galindo martinez on 29/04/20.
//  Copyright © 2020 JCG. All rights reserved.
//

import UIKit
import ObjectMapper

class ResponseWrapper: Mappable {
    
    var resultCount : Int = 0
    var results : [Catalog]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        resultCount <- map["resultCount"]
        results     <- map["results"]
    }
    
    func createSections() -> Dictionary<String, [Catalog]> {
        var sections = [String : [Catalog]]()
        for catalogue in results! {
            let setOfKind = sections[catalogue.kind ?? catalogue.wrapperType!]
            if setOfKind == nil {
                sections[catalogue.kind ?? catalogue.wrapperType!] = [catalogue]
            } else {
                sections[catalogue.kind ?? catalogue.wrapperType!]?.append(catalogue)
            }
        }
        return sections
    }

}
