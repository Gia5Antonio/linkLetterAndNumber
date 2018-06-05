//
//  Singleton.swift
//  linkLetterAndNumber
//
//  Created by Antonio Giaquinto on 16/02/2018.
//  Copyright © 2018 Antonio Giaquinto. All rights reserved.
//

import Foundation

class Position{
    public static var shared = Position()
    
    var positionX = Float()
    var positionY = Float()
    var nextPoint = Int()
    var points  = Int()
}
