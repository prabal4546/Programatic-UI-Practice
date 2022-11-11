//
//  Extensions.swift
//  Dicee-iOS13
//
//  Created by Prabaljit Walia on 07/11/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import UIKit

extension UIView {
     func addBackground() {
         let width = UIScreen.main.bounds.size.width
         let height = UIScreen.main.bounds.size.height

         let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
         imageViewBackground.image = UIImage(named: "GreenBackground")

         imageViewBackground.contentMode = .scaleAspectFill

         self.addSubview(imageViewBackground)
         self.sendSubviewToBack(imageViewBackground)
     }
    func addSubviews(_ views: UIView...) {
      for view in views {
        addSubview(view)
      }
    }

 }
