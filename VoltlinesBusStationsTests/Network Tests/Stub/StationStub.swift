//
//  StationStub.swift
//  VoltlinesBusStationsTests
//
//  Created by Abdelrahman Mohamed on 14.07.2023.
//

import Foundation
@testable import VoltlinesBusStations

extension Station {

    static let stub: Station = .init(
        centerCoordinates: "41.003591781369686,29.072157502045435",
        id: 200,
        name: "ST-200",
        trips: [
            Trip.stub,
            Trip.stub
        ],
        tripsCount: 2
    )
}
