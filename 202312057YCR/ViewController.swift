//
//  ViewController.swift
//  202312057YCR
//
//  Created by 윤채림 on 5/28/25.
//

import UIKit

let name = ["aaa", "bbb", "ccc", "ddd", "eee"]
struct MovieData : Codable {
    let boxOfficeResult : BoxOfficeResult
}
struct BoxOfficeResult : Codable {
    let dailyBoxOfficeList : [DailyBoxOfficeList]
}
struct DailyBoxOfficeList : Codable {
    let movieNm : String
    let audiCnt : String
    let audiAcc : String
    let rank : String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var table: UITableView!
    var movieData : MovieData?
    var movieURL = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=4098a03f7acf473cfd6af4324a250cc1&targetDt="
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        
        movieURL += makeYesterdayString()
        getData()
    }
    
    func makeYesterdayString() -> String {
        let y = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        let dateF = DateFormatter()
        dateF.dateFormat = "yyyyMMdd"
        let day = dateF.string(from: y)
        return day
    }
    func getData(){
        guard let url = URL(string: movieURL) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error!)
                return
            }
            guard let JSONdata = data else {return}
            let dataString = String(data: JSONdata, encoding: .utf8)
            print(dataString!)
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(MovieData.self, from: JSONdata)
                print(decodedData.boxOfficeResult.dailyBoxOfficeList[0].movieNm)
                self.movieData = decodedData
                DispatchQueue.main.async {
                    self.table.reloadData()
                }
                
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! DatailViewController
        dest.movieName = "영화 이름"
        let myIndexPath = table.indexPathForSelectedRow!
        let row = myIndexPath.row
        dest.movieName = (movieData?.boxOfficeResult.dailyBoxOfficeList[row].movieNm)!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as!
        MyTableViewCell
        guard let mRank = movieData?.boxOfficeResult.dailyBoxOfficeList[indexPath.row].rank else {return UITableViewCell()}
        guard let mName = movieData?.boxOfficeResult.dailyBoxOfficeList[indexPath.row].movieNm else { return UITableViewCell()}
        
        cell.movieName.text = "[\(mRank)위] \(mName)"
        
        if let aCnt = movieData?.boxOfficeResult.dailyBoxOfficeList[indexPath.row].audiCnt {
            let numF = NumberFormatter()
            numF.numberStyle = .decimal
            let aCount = Int(aCnt)!
            let result = numF.string(for: aCount)! + "명"
            cell.audiCount.text = "어제: \(result)"
        }
        if let aAcc = movieData?.boxOfficeResult.dailyBoxOfficeList[indexPath.row].audiAcc {
            let numF = NumberFormatter()
            numF.numberStyle = .decimal
            let aAcc1 = Int(aAcc)!
            let result = numF.string(for: aAcc1)! + "명"
            cell.audiAccumulate.text = "누적: \(result)"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "🍿 박스 오피스(영화진흥위원회 제공: " + makeYesterdayString() + ") 🍿"
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.description)
    }


}

