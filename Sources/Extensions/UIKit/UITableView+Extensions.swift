//
//  UITableView+Extensions.swift
//  GetStreamActivityFeed
//
//  Created by Alexey Bukhtin on 01/02/2019.
//  Copyright © 2019 Stream.io Inc. All rights reserved.
//

import UIKit
import GetStream
import Reusable

// MARK: - Setup Post Table View

extension UITableView {

    final func registerSPM<T: UITableViewCell>(cellType: T.Type)
    where T: Reusable {

        let nib = UINib(nibName: String(describing: T.self), bundle: Bundle.module)

        self.register(nib, forCellReuseIdentifier: cellType.reuseIdentifier)
    }

    /// The registration of all table view cells from Activity Feed Components.
    public func registerCells() {
        registerSPM(cellType: PostHeaderTableViewCell.self)
        registerSPM(cellType: PostActionsTableViewCell.self)
        registerSPM(cellType: PostAttachmentImagesTableViewCell.self)
        registerSPM(cellType: OpenGraphTableViewCell.self)
        registerSPM(cellType: SeparatorTableViewCell.self)
        registerSPM(cellType: ActionUsersTableViewCell.self)
        registerSPM(cellType: CommentTableViewCell.self)
        registerSPM(cellType: PaginationTableViewCell.self)
    }
}

// MARK: - Cells

extension UITableView {
    /// Dequeue reusable activity feed post cells with a given indexPath and activity presenter.
    ///
    /// - Parameters:
    ///     - indexPath: the index path of the requested cell.
    ///     - presenter: the `ActivityPresenter` for the requested cell.
    public func postCell<T: ActivityProtocol>(at indexPath: IndexPath, presenter: ActivityPresenter<T>) -> UITableViewCell?
        where T.ActorType: UserNameRepresentable, T.ReactionType: ReactionProtocol {
            guard let cellType = presenter.cellType(at: indexPath.row) else {
                return nil
            }
            
            switch cellType {
            case .activity:
                let cell = dequeueReusableCell(for: indexPath) as PostHeaderTableViewCell
                cell.update(with: presenter.activity, originalActivity: presenter.originalActivity)
                return cell
            case .attachmentImages(let urls):
                let cell = dequeueReusableCell(for: indexPath) as PostAttachmentImagesTableViewCell
                cell.stackView.loadImages(with: urls)
                return cell
            case .attachmentOpenGraphData(let ogData):
                let cell = dequeueReusableCell(for: indexPath) as OpenGraphTableViewCell
                cell.update(with: ogData)
                return cell
            case .actions:
                return dequeueReusableCell(for: indexPath) as PostActionsTableViewCell
            case .separator:
                return dequeueReusableCell(for: indexPath) as SeparatorTableViewCell
            }
    }
}
