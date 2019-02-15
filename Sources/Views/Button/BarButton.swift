//
//  BarButton.swift
//  GetStreamActivityFeed
//
//  Created by Alexey Bukhtin on 16/01/2019.
//  Copyright © 2019 Stream.io Inc. All rights reserved.
//

import UIKit
import SnapKit

public class BarButton: UIButton {
    
    convenience init(title: String, backgroundColor: UIColor) {
        self.init(type: .custom)
        setTitle(title, backgroundColor: backgroundColor, for: .normal)
        clipsToBounds = true
        layer.cornerRadius = 6
        contentEdgeInsets = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
        titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
    }
    
    public override var isEnabled: Bool {
        didSet { sizeToFit() }
    }
    
    public override var isSelected: Bool {
        didSet { sizeToFit() }
    }
}
