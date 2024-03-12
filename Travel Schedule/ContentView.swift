//
//  ContentView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 10.03.2024.
//

import SwiftUI
import OpenAPIURLSession

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            stations()
        }
    }
    func stations() {
        let serverURL: URL
        do {
            serverURL = try Servers.server1()
        } catch {
            preconditionFailure("Cannot obtain server URL")
        }

        let client = Client(
            serverURL: serverURL,
            transport: URLSessionTransport()
        )

        let service = NearestStationsService(
            client: client,
            apikey: Resources.apikey
        )

        Task{
            let stations = try await service.getNearestStations(lat: 59.864177, lng: 30.319163, distance: 50)
            print(stations)
        }
    }
}

#Preview {
    ContentView()
}
