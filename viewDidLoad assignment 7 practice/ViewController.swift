//
//  ViewController.swift
//  viewDidLoad assignment 7 practice
//
//  Created by Ryan Lin on 2022/8/19.
//

import SpriteKit
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //《漸層背景》
        
        //把型別 UIView 存入建立的 gradientView，大小跟螢幕的 View 一樣
        let gradientView = UIView(frame: view.bounds)
        
        //把型別為顯示漸層的 CAGradientLayer 存入 gradientLayer
        let gradientLayer = CAGradientLayer()
        
        //設定漸層Layer和漸層 View 大小一樣
        gradientLayer.frame = gradientView.bounds
        
        //用矩陣設定漸層顏色
        gradientLayer.colors = [UIColor(red: 36/255, green: 59/255, blue: 213/255, alpha: 1).cgColor,UIColor(red: 38/255, green: 82/255, blue: 202/255, alpha: 1).cgColor,UIColor(red: 191/255, green: 197/255, blue: 236/255, alpha: 1).cgColor]
        
        //設定漸層顏色比例(0~1)，漸層有幾層，就要有多少漸層比例的數值
        gradientLayer.locations = [0, 0.5, 1]
        
        /* 把 gradientLayer 設成 gradientView 的 subLayer；
         若貼上的是其他的View，則選擇 addSubview */
        gradientView.layer.addSublayer(gradientLayer)
        
        //gradientView 設成銀幕 View 的 subView
        view.addSubview(gradientView)
        
        
        //《製作mask》
        
        //產生錦鯉魚的 ImageView 和櫻花叢的 ImageView
        let fishImageView = UIImageView(image: UIImage(named: "fish.png"))
        let bloomImageView = UIImageView(image: UIImage(named: "bloom.png"))
        
        //設定櫻花叢顯示的位置及大小
        bloomImageView.frame = CGRect(x: 5, y: 330, width: 370, height: 410)
        
        //讓錦鯉魚的大小等於櫻花叢的尺寸
        fishImageView.frame = bloomImageView.bounds
        
        //設定櫻花叢的遮罩(mask)為錦鯉魚的圖片
        bloomImageView.mask = fishImageView
        
        //設定櫻花叢為 view 的 subview
        view.addSubview(bloomImageView)
        
        //《製作Moon GIF》
        
        //產生 ImageView
        let moonImageView = UIImageView(frame: CGRect(x: 250, y: 90, width: 110, height: 90))
        
        //把moonImageView設為view的subview
        view.addSubview(moonImageView)
        
        //產生動畫圖，（）內為圖片名稱，duration 為 run 完所有圖檔所花的時間（秒）
        let moonAnimatedImage = UIImage.animatedImageNamed("9b59e038e86940eb8c83a6adf8537efam3ChJH7XqdqM1yzj-", duration: 1)
        
        //將 image view 的 image 指定為代表動畫圖片的 UIImage 物件
        moonImageView.image = moonAnimatedImage
        
       
        //利用 《SpriteKit Particle File 製造下雪的粒子效果》
        
        let skView = SKView(frame: view.frame)
        
        view.insertSubview(skView, at: 0)
        
        skView.backgroundColor = UIColor.clear
                
        let scene = SKScene(size: skView.frame.size)
        
        scene.anchorPoint = CGPoint(x: 0.5, y: 1)
        
        scene.backgroundColor = UIColor.clear
                
        let emitterNode = SKEmitterNode(fileNamed: "MyParticle")
               
        scene.addChild(emitterNode!)
        
        skView.presentScene(scene)
        
        view.addSubview(skView)
        
       
        //《製作petal GIF》
        
        let petalImageView = UIImageView(frame: CGRect(x: 60, y: 150, width: 150, height: 150))
        
        view.addSubview(petalImageView)
        
        let petalAnimatedImage = UIImage.animatedImageNamed("f26ca53cbb3e4889a15d02ee30f90d5bQrlx28EyGjgKnDou-", duration: 5)
        
        petalImageView.image = petalAnimatedImage
        
        
    }
    }
    


