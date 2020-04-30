//
//  ViewController.swift
//  iTunesCat
//
//  Created by Jose Galindo martinez on 29/04/20.
//  Copyright © 2020 JCG. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class ViewController: UIViewController {
    
    // UI
    @IBOutlet weak var mSearchBar: UISearchBar!
    @IBOutlet weak var mCollectionView: UICollectionView!
    
    // Logic
    var catalogue = [String : [Catalog]]()
    var sections = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mSearchBar.delegate = self
        
        mCollectionView.emptyDataSetSource = self
        
        // NIB
        let songNib = UINib.init(nibName: "CVCSong", bundle: nil)
        let videoNib = UINib.init(nibName: "CVCVideo", bundle: nil)
        let genericNib = UINib.init(nibName: "CVCGeneric", bundle: nil)
        let headNib = UINib.init(nibName: "ReusableHeader", bundle: nil)
        self.mCollectionView.register(songNib, forCellWithReuseIdentifier: CVCSong.REUSE_IDENTIFIER)
        self.mCollectionView.register(videoNib, forCellWithReuseIdentifier: CVCVideo.REUSE_IDENTIFIER)
        self.mCollectionView.register(genericNib, forCellWithReuseIdentifier: CVCGeneric.REUSE_IDENTIFIER)
        self.mCollectionView.register(headNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderIdentifier")
        self.mCollectionView.dataSource = self
        self.mCollectionView.delegate = self
    }
    
    private func createSections() {
        sections.removeAll()
        catalogue.sorted { $0.0 < $1.0 }.forEach { (key, val) in
            sections.append(key)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let previewvc = segue.destination as! PreviewViewController
        previewvc.previewUrl = (sender as! Catalog).previewUrl
    }
}

extension ViewController : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catalogue[sections[section]]!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        if kind == UICollectionView.elementKindSectionHeader {
            let headView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderIdentifier", for: indexPath) as! ReusableHeader
            headView.sectionTitle.text = sections[indexPath.section]
            return headView
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 300, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let mcatalog = catalogue[sections[indexPath.section]]![indexPath.row]
        switch mcatalog.mediaType {
        case .SONG:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CVCSong.REUSE_IDENTIFIER, for: indexPath) as! CVCSong
            cell.assingCatalog(mcatalog)
            return cell
        case .FEATURE_MOVIE, .TV_EPISODE:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CVCVideo.REUSE_IDENTIFIER, for: indexPath) as! CVCVideo
            cell.assingCatalog(mcatalog)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CVCGeneric.REUSE_IDENTIFIER, for: indexPath) as! CVCGeneric
            cell.assingCatalog(mcatalog)
            return cell
        }
    }
}

extension ViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showPreview", sender: catalogue[sections[indexPath.section]]![indexPath.row])
    }
}

extension ViewController :  UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        Api.shared.makeSearch(searchBar.text!, onSuccess: { (dictionary) in
            self.catalogue.removeAll()
            self.catalogue = dictionary as! Dictionary<String, [Catalog]>
            self.createSections()
            self.mCollectionView.reloadData()
        }) { (onError) in
            
        }
        self.view.endEditing(true)
    }
    
}

extension ViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellHeigth = 0
        var cellWidth = Int(self.view.frame.width)
        let tmpCat = self.catalogue[sections[indexPath.section]]![indexPath.row]
        switch tmpCat.mediaType {
        case .SONG:
            cellHeigth = CVCSong.CELL_HEIGHT
            break
        case .FEATURE_MOVIE , .TV_EPISODE:
            cellHeigth = CVCVideo.CELL_HEIGHT
            cellWidth = CVCVideo.CELL_WIDTH
            break
        default:
            cellHeigth = 60;
        }
        return CGSize(width: cellWidth, height: cellHeigth)
    }
}


//
extension ViewController : DZNEmptyDataSetSource {
    
    func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let message = "Please search something in iTunes collection"
        let atts = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20)]
        return NSAttributedString.init(string: message, attributes: atts)
    }
}
