//
//  MapPresenter.swift
//  VoltlinesBusStations
//
//  Created by Abdelrahman Mohamed on 10.07.2023.
//

import Foundation

protocol MapPresenterDelegate: AnyObject {
    func showIndicator()
    func hideIndicator()
    func showError(error: String)
    func presentStations(stations: [Station])
}

class MapPresenter {

    private weak var delegate: MapPresenterDelegate?
    var service: StationsServiceable = StationsService()
    var stations = [Station]()
    var selectedStation: Station?
    let router: MapVCRouter

    init(
        delegate: MapPresenterDelegate?,
        router: MapVCRouter
    ) {
        self.delegate = delegate
        self.router = router
    }

    func viewDidLoad() {
        delegate?.showIndicator()
        fetchStations { [weak self] result in
            guard let self = self else { return }

            self.delegate?.hideIndicator()
            switch result {
            case .success(let response):
                self.stations = response
                self.delegate?.presentStations(stations: stations)
            case .failure(let error):
                self.delegate?.showError(error: error.localizedDescription)
            }
        }
    }

    func fetchStations(completionHanlder: @escaping (Result<[Station], RequestError>) -> Void) {
        Task(priority: .background) {
            let result = await service.getStations()
            completionHanlder(result)
        }
    }
    
    func navigateToTripList(station: Station) {
        guard let delegate = delegate else { return }
        router.navigateToListTripScreen(from: delegate, station: station)
    }
}
