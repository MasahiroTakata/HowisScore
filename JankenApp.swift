//
//  ViewController.swift
//  JankenApp
//
//  Created by 高田将弘 on 2019/07/08.
//  Copyright © 2019 高田将弘. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var enemyJanken: UIImageView!
    @IBAction func gu(_ sender: Any) {
    }
    @IBAction func choki(_ sender: Any) {
    }
    @IBAction func pa(_ sender: Any) {
    }
    // 一定の間隔で処理を行う為のタイマー
    var timer: Timer?
    // 画像の番号
    var imageArrayNo = 0
    // グーチョキパーの画像を格納する配列
    let imageNameArray = [
        "gu",
        "choki",
        "pa",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 相手側のグーチョキパーを0.1秒おきに表示させる
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.onTimer(timer:)), userInfo: nil, repeats: true)
        // 自分のグーチョキパーを表示
//        gu.image = UIImage(named: "gu")
//        choki.image = UIImage(named: "choki")
//        pa.image = UIImage(named: "pa")
    }

    // 自分のグーチョキパーのどれかがタップした時に、呼び出すメソッド
    
    // Timerクラスで呼び出されるメソッド
    @objc func onTimer(timer: Timer){
        if (imageArrayNo == imageNameArray.count) {
            imageArrayNo = 0
        }
        
        enemyJanken.image = UIImage(named: imageNameArray[imageArrayNo])
        self.view.addSubview(enemyJanken)
        imageArrayNo += 1
    }
}

