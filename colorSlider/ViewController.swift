//
//  ViewController.swift
//  colorSlider
//
//  Created by 林祐辰 on 2020/4/30.
//  Copyright © 2020 smirkiiiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var simpsonView: UIImageView!
    
    @IBOutlet weak var redResult: UISlider!
    @IBOutlet weak var greenResult: UISlider!
    @IBOutlet weak var blueResult: UISlider!
    @IBOutlet weak var alphaResult: UISlider!
    
    @IBOutlet weak var redResultNum: UILabel!
    @IBOutlet weak var greenResultNum: UILabel!
    @IBOutlet weak var blueResultNum: UILabel!
    @IBOutlet weak var alphaResultNum: UILabel!
        
    @IBOutlet weak var redOn: UISwitch!
    @IBOutlet weak var greeenOn: UISwitch!
    @IBOutlet weak var blueOn: UISwitch!
    
    @IBOutlet weak var gradientSlider: UISlider!
    @IBOutlet weak var shadowSlider: UISlider!
    
    @IBOutlet weak var allViewContainer: UIView!
    @IBOutlet weak var gradientView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        simpsonView.layer.borderColor = UIColor.black.cgColor
        simpsonView.layer.borderWidth = 2
    }

    @IBAction func sliderChange(_ sender: UISlider) {
        
    simpsonView.backgroundColor = UIColor(displayP3Red: CGFloat(redResult.value), green: CGFloat(greenResult.value), blue: CGFloat(blueResult.value), alpha: CGFloat(alphaResult.value))
            
      redResultNum.text = String(format: "%.2f", redResult.value)
      greenResultNum.text = String(format: "%.2f", greenResult.value)
      blueResultNum.text = String(format: "%.2f", blueResult.value)
      alphaResultNum.text = String(format: "%.2f", alphaResult.value)
    }
    
    @IBAction func randomSliderChange(_ sender: UISlider) {
        if(redOn.isOn == true && greeenOn.isOn == true && blueOn.isOn == true){
        let randomRedNum = Float.random(in:0...1)
        let randomGreenNum = Float.random(in:0...1)
        let randomBlueNum = Float.random(in:0...1)
        let randomAlphaNum = Float.random(in:0...1)

        redResult.value = randomRedNum
        greenResult.value = randomGreenNum
        blueResult.value = randomBlueNum
        alphaResult.value = randomAlphaNum
            
        simpsonView.backgroundColor = UIColor(red: CGFloat(randomRedNum), green: CGFloat(randomGreenNum), blue: CGFloat(randomBlueNum), alpha: CGFloat(randomAlphaNum))

        redResultNum.text = String(format: "%.2f", randomRedNum)
        greenResultNum.text = String(format: "%.2f", randomGreenNum)
        blueResultNum.text = String(format: "%.2f", randomBlueNum)
        alphaResultNum.text = String(format: "%.2f", randomAlphaNum)
        }
        
    }
      
    @IBAction func switchOn(_ sender: UISwitch) {
        redResult.isEnabled = redOn.isOn ? true :false
        greenResult.isEnabled = greeenOn.isOn ? true :false
        blueResult.isEnabled = blueOn.isOn ? true :false
    }
    

    
    @IBAction func changeRadius(_ sender: UISlider) {
        simpsonView.clipsToBounds = true
        simpsonView.layer.cornerRadius = CGFloat(30*(sender.value))
        allViewContainer.layer.cornerRadius = CGFloat(30*(sender.value))
    }
    
    
    
    @IBAction func changeShadow(_ sender: UISlider) {
        allViewContainer.layer.masksToBounds = false
        allViewContainer.layer.shadowOpacity = Float(CGFloat(shadowSlider.value))
        allViewContainer.layer.shadowRadius = CGFloat((sender.value))
        allViewContainer.layer.shadowOffset = CGSize(width: 5*Int(sender.value), height: 5*Int(sender.value))
    }
    
    @IBAction func changeGradient(_ sender: UISlider) {
        let changeColorLayer = CAGradientLayer()
        gradientView.alpha = CGFloat(sender.value)
        changeColorLayer.frame = gradientView.bounds
        changeColorLayer.startPoint = CGPoint(x: 1, y: 1)
        changeColorLayer.endPoint = CGPoint(x: 0, y: 0)
        changeColorLayer.colors = [UIColor.red.cgColor ,UIColor.green.cgColor]
        changeColorLayer.locations = [0.0,NSNumber(value: gradientSlider.value)]
        gradientView.layer.addSublayer(changeColorLayer)
    }
}
