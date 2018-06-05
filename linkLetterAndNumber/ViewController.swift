//
//  ViewController.swift
//  linkLetterAndNumber
//
//  Created by Antonio Giaquinto on 15/02/2018.
//  Copyright © 2018 Antonio Giaquinto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var drawView: CanvasView!
    @IBOutlet weak var startHere: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    
    var points = 0
    var finalPoints = 0
    var seconds = 0.0
    var timer = Timer()
    var isTimerRunning = false
    var time = 3.0 //3 min
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        runTimer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
        self.isTimerRunning = true
    }
    
    @objc func updateTimer(){
        seconds += 0.1
        
        if seconds >= (time * 60.0){
            restartTimer()
            debugPrint("Time is over")
        }
        //debugPrint("Position X: \(Position.shared.positionX), Position Y: \(Position.shared.positionY)")
        //debugPrint("Timer: \(seconds)")
        check()
    }

    func restartTimer() {
        print("Restart ok")
        timer.invalidate()
        seconds = 0
        isTimerRunning = false
    }
    
    func check() {
        
        for button in buttons {
            
            let midWidth = button.frame.width
            let midHeight = button.frame.height
            
            if abs(Float(Position.shared.positionX) - Float(button.center.x)) < Float(midWidth) && abs(Float(Position.shared.positionY) - Float(button.center.y)) < Float(midHeight) {
                if button.tag == 0 {
                    debugPrint("First Element")
                    startHere.isHidden = true
                    points = button.tag + 1
                    debugPrint("Point: \(points)")
                    Position.shared.nextPoint = button.tag + 1 
                }else if button == buttons[Position.shared.nextPoint] {
                    debugPrint("Other Elements")
                    
                    if button.tag < 26 {
                    Position.shared.nextPoint += 1
                    }
                    
                    points = button.tag + 1
                    debugPrint("OK: \(button.tag)")
                    debugPrint("Point: \(points)")
                }else {
                debugPrint("Wrong point")
                }
            }
        }
    }
}

