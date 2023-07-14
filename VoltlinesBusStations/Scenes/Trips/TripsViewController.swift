//
//  TripsViewController.swift
//  VoltlinesBusStations
//
//  Created by Abdelrahman Mohamed on 10.07.2023.
//

import UIKit

class TripsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var presenter: TripsPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Trips"
        setupTableView()

        presenter?.viewDidLoad()
    }
}

extension TripsViewController: TripsPresenterDelegate {

    func showError(error: String) {
        print("TripsViewController.Error:", error)
    }

    func presentStations(station: Station) {
        tableView.reloadData()
        print("TripsViewController.station:", station)
    }
}

extension TripsViewController: UITableViewDataSource {

    func setupTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.register(
            UINib(nibName: TripsTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: TripsTableViewCell.identifier
        )
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getTripsCount() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: TripsTableViewCell.identifier, for: indexPath) as! TripsTableViewCell
        presenter?.configure(cell: cell, for: indexPath.row)
        presenter?.didTap(cell: cell, for: indexPath.row)
        return cell
    }
}
