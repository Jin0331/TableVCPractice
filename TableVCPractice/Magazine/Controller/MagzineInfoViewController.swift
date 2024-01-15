//
//  MagzineInfoViewController.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/15/24.
//

import UIKit
import WebKit

class MagzineInfoViewController: UIViewController {
    
    var urlString : String?
    
    @IBOutlet var magzineWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webViewAppear ()
    }

}

extension MagzineInfoViewController {
    func webViewAppear () {
        if let url = URL(string: urlString!) {
            let request = URLRequest(url: url)
            
            magzineWebView.load(request)
        }
    }
}
