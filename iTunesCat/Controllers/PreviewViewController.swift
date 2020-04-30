//
//  PreviewViewController.swift
//  iTunesCat
//
//  Created by Jose Galindo martinez on 30/04/20.
//  Copyright © 2020 JCG. All rights reserved.
//

import UIKit
import WebKit

class PreviewViewController: UIViewController {

    // UI
    @IBOutlet weak var mWebView: WKWebView!
    
    //Logic
    var previewUrl : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let murl = URL(string: "https://video-ssl.itunes.apple.com/itunes-assets/Video122/v4/5c/6f/0b/5c6f0b63-8904-de5f-d38e-3ffaba1afed8/mzvf_7416392252910735463.640x474.h264lc.U.p.m4v")!
        let murl = URL(string: previewUrl!)!
        let request = URLRequest.init(url: murl)
        mWebView.load(request)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
