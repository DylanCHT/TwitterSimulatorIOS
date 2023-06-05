//
//  RoundedShape.swift
//  Twitter
//
//  Created by Dylan  Tao on 3/17/23.
//

import SwiftUI


// custom modifier
struct RoundedShape: Shape {
    var corner: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: 80, height: 80))
        
        return Path(path.cgPath)
    }
}
