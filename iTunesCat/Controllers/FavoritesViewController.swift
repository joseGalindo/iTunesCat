//
//  FavoritesViewController.swift
//  iTunesCat
//
//  Created by Jose Galindo martinez on 30/04/20.
//  Copyright © 2020 JCG. All rights reserved.
//

import UIKit
import DZNEmptyDataSet
import Nuke

class FavoritesViewController: UIViewController {

    @IBOutlet weak var mTableView: UITableView!
    
    var favorites : [EntitySaved] = [EntitySaved]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mTableView.emptyDataSetSource = self
        mTableView.tableFooterView = UIView()
        
        favorites = ManageDatabase.sharedInstance.getAllFavorites()
        mTableView.reloadData()
    }


}

extension FavoritesViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell.init()
    }
}

extension FavoritesViewController : DZNEmptyDataSetSource {
    func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let message = "There's no favorites saved"
        let atts = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20)]
        return NSAttributedString.init(string: message, attributes: atts)
    }
}
