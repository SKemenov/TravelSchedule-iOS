//
//  ContentView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 10.03.2024.
//

import SwiftUI
import OpenAPIURLSession

struct ContentView: View {
    let serverURL: URL
    let client: Client

    init() {
        do {
            serverURL = try Servers.server1()
        } catch {
            preconditionFailure("Cannot obtain server URL")
        }
        client = Client(
            serverURL: serverURL,
            transport: URLSessionTransport(),
            middlewares: [AuthenticationMiddleware(authorizationHeaderFieldValue: Resources.apiKey)]
        )
    }

    var body: some View {
        VStack {
            Button("getNearestStations") {
                nearestStations()
            }
            .padding()
            Button("getCopyright") {
                copyright()
            }
            .padding()
        }
        .padding()

    }
    
}

private extension ContentView {
    func nearestStations() {
        let service = NearestStationsService(client: client)
        Task{
            do {
                let response = try await service.getNearestStations(lat: 59.864177, lng: 30.319163, distance: 50)
                guard let stations = response.stations,
                      let limit = response.pagination?.limit else { return }
                print(stations, "\n pagination.limit:", limit, "\n stations.count:",stations.count)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func copyright() {
        let service = CopyrightService(client: client)
        Task{
            do {
                let response = try await service.getCopyright()
//                guard let response else { return }
                print(response)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    ContentView()
}
