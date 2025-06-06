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
           // 앱 처음 켰을 때 기본 페이지
           loadWebPage(urlString: "https://map.naver.com/p/search/CGV")
       }
    
    func loadWebPage(urlString: String) {
        if let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: encoded) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    

    @IBAction func cgvTap(_ sender: UIButton) {
        
        loadWebPage(urlString: "https://map.naver.com/p/search/CGV")
    }
    

    @IBAction func megaTap(_ sender: UIButton) {
        
        loadWebPage(urlString: "https://map.naver.com/p/search/메가박스")
    }
    

    @IBAction func lotteTap(_ sender: UIButton) {
        
        loadWebPage(urlString: "https://map.naver.com/p/search/롯데시네마")
    }
}
