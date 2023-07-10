//
//  TripsPresenter.swift
//  VoltlinesBusStations
//
//  Created by Abdelrahman Mohamed on 10.07.2023.
//

import Foundation

protocol TripsPresenterDelegate: AnyObject {
    var presenter: TripsPresenter? { get set }
    func presentStations(station: Station)
}

class TripsPresenter {

    private weak var delegate: TripsPresenterDelegate?
    var station: Station?

    init(delegate: TripsPresenterDelegate, station: Station) {
        self.delegate = delegate
        self.station = station
    }

    func viewDidLoad() {
        guard let newStation = station else { return }
        delegate?.presentStations(station: newStation)
    }
}
