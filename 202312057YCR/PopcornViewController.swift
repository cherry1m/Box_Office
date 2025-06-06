//
//  PopcornViewController.swift
//  202312057YCR
//
//  Created by 윤채림 on 6/7/25.
//

import UIKit

class PopcornViewController: UIViewController {
    
    // 팝콘 배열
    let popcorns = ["🧈 오리지널 팝콘", "🍮 카라멜 팝콘", "🧄 갈릭 팝콘", "🧈🍮 반반 팝콘", "🧀 치즈 팝콘"]
    
    // UI 구성 요소
    let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "🍿 오늘의 팝콘은?"
        label.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    let recommendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("🎲 팝콘 추천 받기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        button.backgroundColor = UIColor.systemYellow
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 12
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // UI 배치
        view.addSubview(resultLabel)
        view.addSubview(recommendButton)
        
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        recommendButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            recommendButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 40),
            recommendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recommendButton.widthAnchor.constraint(equalToConstant: 200),
            recommendButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // 버튼 액션 연결
        recommendButton.addTarget(self, action: #selector(recommendPopcorn), for: .touchUpInside)
    }
    
    @objc func recommendPopcorn() {
        // 랜덤 팝콘 추천
        let random = popcorns.randomElement() ?? "🍿 아무 팝콘도 없어요!"
        resultLabel.text = "오늘의 팝콘은...\n\(random)"
    }
}
