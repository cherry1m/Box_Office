//
//  DatailViewController.swift
//  202312057YCR
//
//  Created by 윤채림 on 5/28/25.
//

import UIKit
import WebKit

class DatailViewController: UIViewController {

    
    @IBOutlet weak var webView: WKWebView!
    var movieName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = movieName
        let urlString = "https://m.search.naver.com/search.naver?query=영화+순위&sm=mtp_hty.top&where=m" + movieName

               
               let encodedUrlString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!

               
               guard let url = URL(string: encodedUrlString) else { return }
               let request = URLRequest(url: url)
               webView.load(request)
           }
       }
