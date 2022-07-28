//
//  UICollectionView+Extensions.swift
//  GetStreamActivityFeed_ios
//
//  Created by Peter Gulyas on 2022-07-25.
//

import Foundation
import UIKit
import GetStream
import Reusable

    // MARK: - Setup Post Table View

extension UICollectionView {

    final func registerSPM<T: UICollectionViewCell>(cellType: T.Type)
    where T: Reusable {

        let nib = UINib(nibName: String(describing: T.self), bundle: Bundle.module)

        self.register(nib, forCellWithReuseIdentifier: cellType.reuseIdentifier)
        }
}
