//
//  TripsViewController.swift
//  VoltlinesBusStations
//
//  Created by Abdelrahman Mohamed on 10.07.2023.
//

import UIKit

enum Section {

    case trips
}

typealias TableDataSource = UITableViewDiffableDataSource<Section, Trip>

class TripsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var presenter: TripsPresenter?

    lazy var dataSource: TableDataSource = {

        let dataSource = TableDataSource(
            tableView: tableView
        ) { tableView, indexPath, _ in

            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: TripsTableViewCell.identifier,
                for: indexPath
            ) as? TripsTableViewCell else { return UITableViewCell() }

            self.presenter?.configure(cell: cell, for: indexPath.row)
            self.presenter?.didTap(cell: cell, for: indexPath.row)
            return cell
        }

        return dataSource
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Trips"
        setupTableView()

        presenter?.viewDidLoad()
    }

    func setupTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(
            UINib(nibName: TripsTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: TripsTableViewCell.identifier
        )
    }

    func showAlert(alertType: AlertType) {

        let customAlert = CustomAlertViewController()

        switch alertType {
        case .success:
            customAlert.alertTitle = "Congrats"
            customAlert.alertMessage = "Trip selected."
            customAlert.actionButtonTitle = "Done"
            customAlert.onTap = { [weak self] in
                guard let self = self else { return }
                self.presenter?.popView(view: self)
            }
        case .failure:
            customAlert.alertTitle = "The trip you selected is full"
            customAlert.alertMessage = "Please select another one."
            customAlert.actionButtonTitle = "Select a trip"
        }


        customAlert.show()
    }

    func updateSnapShot(trips: [Trip]) {

        var snapShot = NSDiffableDataSourceSnapshot<Section, Trip>()
        snapShot.appendSections([.trips])
        snapShot.appendItems(trips)

        dataSource.apply(snapShot)
    }
}
