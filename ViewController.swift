//
//  ViewController.swift
//  HowisScore
//
//  Created by 高田将弘 on 2019/06/03.
//  Copyright © 2019 高田将弘. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreText: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    // 一定の間隔で処理を行う為のタイマー
    var timer: Timer?
    // 画像の番号
    var imageArrayNo = 0
    // 画像の名前を格納する配列
    let imageNameArray = [
        "test",
        "emilia",
        "rielly",
        "arutemis",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scoreText.keyboardType = UIKeyboardType.numberPad
        // 画像が１秒おきに切り替わる様にして表示させる
        let screenW:CGFloat = view.frame.size.width
        // 画像表示させるための画面を作成する
        imageView.frame = CGRect(x:0, y:0, width: 128, height: 128)
        // 画像の中心を画面の中心に設定
        imageView.center = CGPoint(x:screenW/2, y:440)
        // タイマーメソッド呼び出し
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.onTimer(timer:)), userInfo: nil, repeats: true)
    }
    
    @IBAction func howIsScore(_ sender: Any) {
        // nilを許容する事によって、値の入力チェックを出来るようにする
        var score:Int? = nil
        score = Int(scoreText.text!)
        // nil判定
        if (score == nil) {
            // ダイアログメッセージを表示させる
            validationMessage()
        } else {
            // 2秒間画像を超高速でランダム表示させる（Timerメソッドを2秒間呼んだままにする）
            // タイマーメソッド呼び出しを止める
            timer!.invalidate()
            // テキストの点数を判定
            if case 0...20 = Int(scoreText.text!)! {
                imageView.image = UIImage(named: "test")
            } else if case 21...60 = Int(scoreText.text!)! {
                imageView.image = UIImage(named: "emilia")
            } else if case 61...80 = Int(scoreText.text!)! {
                imageView.image = UIImage(named: "rielly")
            } else if case 81...100 = Int(scoreText.text!)! {
                imageView.image = UIImage(named: "arutemis")
            } else {
                // ダイアログメッセージを表示させる
                validationMessage()
            }
            
            // キーボードを閉じる
            scoreText.resignFirstResponder()
            self.view.addSubview(imageView)
        }
    }
    
    // ダイアログメッセージを表示するメソッド（引数なし）
    func validationMessage() {
        let alert = UIAlertController(title: "メッセージ", message: "0から100までを入力してください。", preferredStyle: UIAlertController.Style.alert)
        let okayButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okayButton)
        present(alert, animated: true, completion: nil)
    }
    
    // Timerで呼び出されるメソッド
    @objc func onTimer(timer: Timer){
        if (imageArrayNo == imageNameArray.count) {
            imageArrayNo = 0
        }
        
        imageView.image = UIImage(named: imageNameArray[imageArrayNo])
        self.view.addSubview(imageView)
        imageArrayNo += 1
    }
}
