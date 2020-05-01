//
//  Utils.swift
//  iTunesCat
//
//  Created by Jose Galindo martinez on 01/05/20.
//  Copyright © 2020 JCG. All rights reserved.
//

import UIKit

class Utils: NSObject {
}

extension UIViewController {
    
    func showError(_ message : String) {
        let alertc = UIAlertController.init(title: "Error", message: message, preferredStyle: .alert)
        alertc.addAction(UIAlertAction.init(title: "Close", style: .default, handler: nil))
        self.present(alertc, animated: true, completion: nil)
    }
}
