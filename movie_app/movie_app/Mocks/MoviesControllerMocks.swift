//
//  MoviesControllerMocks.swift
//  movie_app
//
//  Created by Marcela Limieri Tozzato on 13/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation
import Alamofire

class MoviesControllerMockingForSuccess3Movies: MockingURLProtocol {
 
    override func startLoading() {
        if let data = "{\n\"page\":1,\n\"total_results\":10000,\n\"total_pages\":500,\n\"results\":[\n{\n\"popularity\":576.414,\n\"vote_count\":1802,\n\"video\":false,\n\"poster_path\":\"/xBHvZcjRiWyobQ9kxBhO6B2dtRI.jpg\",\n\"id\":419704,\n\"adult\":false,\n\"backdrop_path\":\"/p3TCqUDoVsrIm8fHK9KOTfWnDjZ.jpg\",\n\"original_language\":\"en\",\n\"original_title\":\"AdAstra\",\n\"genre_ids\":[\n12,\n18,\n9648,\n878,\n53\n],\n\"title\":\"AdAstra\",\n\"vote_average\":6,\n\"overview\":\"Thenearfuture,atimewhenbothhopeandhardshipsdrivehumanitytolooktothestarsandbeyond.WhileamysteriousphenomenonmenacestodestroylifeonplanetEarth,astronautRoyMcBrideundertakesamissionacrosstheimmensityofspaceanditsmanyperilstouncoverthetruthaboutalostexpeditionthatdecadesbeforeboldlyfacedemptinessandsilenceinsearchoftheunknown.\",\n\"release_date\":\"2019-09-17\"\n},\n{\n\"popularity\":262.735,\n\"vote_count\":2302,\n\"video\":false,\n\"poster_path\":\"/db32LaOibwEliAmSL2jjDF6oDdj.jpg\",\n\"id\":181812,\n\"adult\":false,\n\"backdrop_path\":\"/jOzrELAzFxtMx2I4uDGHOotdfsS.jpg\",\n\"original_language\":\"en\",\n\"original_title\":\"StarWars:TheRiseofSkywalker\",\n\"genre_ids\":[\n28,\n12,\n878\n],\n\"title\":\"StarWars:TheRiseofSkywalker\",\n\"vote_average\":6.6,\n\"overview\":\"ThesurvivingResistancefacestheFirstOrderonceagainasthejourneyofRey,FinnandPoeDameroncontinues.Withthepowerandknowledgeofgenerationsbehindthem,thefinalbattlebegins.\",\n\"release_date\":\"2019-12-18\"\n},\n{\n\"popularity\":243.65,\n\"vote_count\":7689,\n\"video\":false,\n\"poster_path\":\"/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg\",\n\"id\":475557,\n\"adult\":false,\n\"backdrop_path\":\"/n6bUvigpRFqSwmPp1m2YADdbRBc.jpg\",\n\"original_language\":\"en\",\n\"original_title\":\"Joker\",\n\"genre_ids\":[\n80,\n18,\n53\n],\n\"title\":\"Joker\",\n\"vote_average\":8.3,\n\"overview\":\"Duringthe1980s,afailedstand-upcomedianisdriveninsaneandturnstoalifeofcrimeandchaosinGothamCitywhilebecominganinfamouspsychopathiccrimefigure.\",\n\"release_date\":\"2019-10-02\"\n}\n]\n}\n\n".data(using: String.Encoding.utf8),
               let url = request.url,
            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: self.getCannedHeaders()) {
               client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: URLCache.StoragePolicy.notAllowed)
               client?.urlProtocol(self, didLoad: data)
           }
        client?.urlProtocolDidFinishLoading(self)
    }
}
