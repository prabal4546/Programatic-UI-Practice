//
//  EggView.swift
//  EggTimer
//
//  Created by Prabaljit Walia on 07/11/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

final class EggView: UIView {
    
    private var eggImage:UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "soft_egg")
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var eggTitle:UILabel = {
        let label = UILabel()
        label.text = "Soft"
        return label
    }()

}
