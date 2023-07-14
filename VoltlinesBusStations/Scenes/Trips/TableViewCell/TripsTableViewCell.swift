//
//  TripsTableViewCell.swift
//  VoltlinesBusStations
//
//  Created by Abdelrahman Mohamed on 11.07.2023.
//

import UIKit

class TripsTableViewCell: UITableViewCell {

    static let identifier = "TripsTableViewCell"

    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var stationTimeLabel: UILabel!
    @IBOutlet weak var bookTripsButton: UIButton!

    var didBookTrip: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()

        setupUI()
    }

    func setupUI() {
        stationNameLabel.textColor = .label
        stationNameLabel.font = .systemFont(ofSize: 20)
        stationTimeLabel.textColor = .label
        stationTimeLabel.font = .systemFont(ofSize: 20)
        bookTripsButton.setTitle("Book", for: .normal)
        bookTripsButton.setTitleColor(.white, for: .normal)
        bookTripsButton.backgroundColor = .blue
        bookTripsButton.layer.cornerRadius = 20
        bookTripsButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }

    @IBAction func didTapBookTrip(_ sender: Any) {
        didBookTrip?()
    }
}

extension TripsTableViewCell: TripsCellDelegate {

    func displayBusName(value: String) {
        stationNameLabel.text = value
    }

    func displayBusTime(value: String) {
        stationTimeLabel.text = value
    }
}
