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
    
    @IBAction func howIsScore(_ sender: Any) {
        // スクリーンサイズの取得
        let screenW:CGFloat = view.frame.size.width
        let screenH:CGFloat = view.frame.size.height
        var view:UIImage?
        view = imageView.image
        
        if (view != nil) {
            imageView.image = nil
            //imageView.removeFromSuperview() // 画像の削除
            print("画像あり")
        } else {
            print("画像がありません。")
        }

        imageView.frame = CGRect(x:0, y:0, width: 128, height: 128)
        imageView.center = CGPoint(x:screenW/2, y:screenH/2)
        // nilを許容する
        var score:Int? = nil
        score = Int(scoreText.text!)
        // nil判定
        if (score == nil) {
            print("空です")
        } else {
            // テキストの点数を判定
            if case 0...20 = Int(scoreText.text!)! {
                imageView.image = UIImage(named: "test")
                print("あほか")
            } else if case 21...60 = Int(scoreText.text!)! {
                print("まだがんばれる")
            } else if case 61...80 = Int(scoreText.text!)! {
                print("悪くない")
            } else if case 81...100 = Int(scoreText.text!)! {
                print("すばらしい")
            } else {
                print("0から100までを入力してください。")
            }
            
            self.view.addSubview(imageView)
        }
        // キーボードを閉じる
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scoreText.keyboardType = UIKeyboardType.numberPad
    }

}

