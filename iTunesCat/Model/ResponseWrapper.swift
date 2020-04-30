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
            print("Append \(catalogue.kind) ")
            let setOfKind = sections[catalogue.kind ?? catalogue.wrapperType!]
            if setOfKind == nil {
//                print("Container is nil, created and added")
                sections[catalogue.kind ?? catalogue.wrapperType!] = [catalogue]
            } else {
//                print("Container is not nil, added")
                sections[catalogue.kind ?? catalogue.wrapperType!]?.append(catalogue)
            }
        }
        return sections
    }

}
