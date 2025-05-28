//
//  MapViewController.swift
//  202312057YCR
//
//  Created by 윤채림 on 5/28/25.
//

import UIKit
import WebKit

class MapViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlKorString = "http://map.naver.com/p/search/영화관"
        let urlString = urlKorString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        guard let url = URL(string: urlString) else {return}
        let request = URLRequest(url: url)
        webView.load(request)
    }
    


}
