//
//  ManageDatabase.swift
//  iTunesCat
//
//  Created by Jose Galindo martinez on 30/04/20.
//  Copyright © 2020 JCG. All rights reserved.
//

import UIKit
import RealmSwift

class ManageDatabase: NSObject {
    
    @objc static let sharedInstance: ManageDatabase = {
        let instance = ManageDatabase()
        return instance
    }()
    
    func addCatalogue(_ catalogue : Catalog) -> Bool {
        let realm = try! Realm()
        realm.beginWrite()
        realm.add(catalogue.createSaveObject(), update: .all)
        do {
            try realm.commitWrite()
        } catch let error {
            print("[LOG] Could not write to database: ", error)
            return false
        }
        return true
    }

    func getAllFavorites() -> [EntitySaved] {
        let realm = try! Realm()
        let result = realm.objects(EntitySaved.self)
        return Array(result)
    }
    
}
