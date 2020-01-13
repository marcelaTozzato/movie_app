//
//  Mocks.swift
//  movie_app
//
//  Created by Marcela Limieri Tozzato on 12/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation

enum MockDirection: String {
    case get = "GET", put = "PUT", post = "POST"
    
    private func isToken(_ item: String) -> Bool {
        let num = Int(item)
        return num != nil
    }
    
    fileprivate func kind(_ tokens: [String] = []) ->  [String] {
        guard
            let lastToken = tokens.last,
            let firstToken = tokens.first,
            let lastAction = output.last,
            let firstAction = output.first
            else { return [] }
        
        //Process Index Action
        if(!isToken(lastToken) && self == .get) {
            return [lastToken, lastAction]
        }
        
        //Process Show Action
        if(isToken(lastToken) && self == .get) {
            return [firstToken, firstAction]
        }
        
        //Process Create Action
        if(!isToken(lastToken) && self == .post) {
            return [lastToken, firstAction]
        }
        
        return [firstToken, lastAction]
    }
    
    private var output: [String] {
        switch self {
        case .get: return ["SHOW", "INDEX"]
        case .put: return ["UPDATE"]
        case .post: return ["CREATE"]
        }
    }
}

struct Mocks {
    private static var mocks = [
        "popular": ["INDEX": "{\n\"page\":1,\n\"total_results\":10000,\n\"total_pages\":500,\n\"results\":[\n{\n\"popularity\":576.414,\n\"vote_count\":1802,\n\"video\":false,\n\"poster_path\":\"/xBHvZcjRiWyobQ9kxBhO6B2dtRI.jpg\",\n\"id\":419704,\n\"adult\":false,\n\"backdrop_path\":\"/p3TCqUDoVsrIm8fHK9KOTfWnDjZ.jpg\",\n\"original_language\":\"en\",\n\"original_title\":\"AdAstra\",\n\"genre_ids\":[\n12,\n18,\n9648,\n878,\n53\n],\n\"title\":\"AdAstra\",\n\"vote_average\":6,\n\"overview\":\"Thenearfuture,atimewhenbothhopeandhardshipsdrivehumanitytolooktothestarsandbeyond.WhileamysteriousphenomenonmenacestodestroylifeonplanetEarth,astronautRoyMcBrideundertakesamissionacrosstheimmensityofspaceanditsmanyperilstouncoverthetruthaboutalostexpeditionthatdecadesbeforeboldlyfacedemptinessandsilenceinsearchoftheunknown.\",\n\"release_date\":\"2019-09-17\"\n},\n{\n\"popularity\":262.735,\n\"vote_count\":2302,\n\"video\":false,\n\"poster_path\":\"/db32LaOibwEliAmSL2jjDF6oDdj.jpg\",\n\"id\":181812,\n\"adult\":false,\n\"backdrop_path\":\"/jOzrELAzFxtMx2I4uDGHOotdfsS.jpg\",\n\"original_language\":\"en\",\n\"original_title\":\"StarWars:TheRiseofSkywalker\",\n\"genre_ids\":[\n28,\n12,\n878\n],\n\"title\":\"StarWars:TheRiseofSkywalker\",\n\"vote_average\":6.6,\n\"overview\":\"ThesurvivingResistancefacestheFirstOrderonceagainasthejourneyofRey,FinnandPoeDameroncontinues.Withthepowerandknowledgeofgenerationsbehindthem,thefinalbattlebegins.\",\n\"release_date\":\"2019-12-18\"\n},\n{\n\"popularity\":243.65,\n\"vote_count\":7689,\n\"video\":false,\n\"poster_path\":\"/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg\",\n\"id\":475557,\n\"adult\":false,\n\"backdrop_path\":\"/n6bUvigpRFqSwmPp1m2YADdbRBc.jpg\",\n\"original_language\":\"en\",\n\"original_title\":\"Joker\",\n\"genre_ids\":[\n80,\n18,\n53\n],\n\"title\":\"Joker\",\n\"vote_average\":8.3,\n\"overview\":\"Duringthe1980s,afailedstand-upcomedianisdriveninsaneandturnstoalifeofcrimeandchaosinGothamCitywhilebecominganinfamouspsychopathiccrimefigure.\",\n\"release_date\":\"2019-10-02\"\n}\n]\n}\n\n"
        ]
    ]
    
    private static func index(_ resource: String, action: String) -> String? {
        guard let book = mocks[resource] else {
            print("FAILED TO FIND KEY")
            return nil
        }
        guard let action = book[action] else {
            print("FAILED TO FIND RESOURCE ACTION, PLEASE INCLUDE MOCK")
            return nil
        }
        return action
    }
    
    static func find(_ request: URLRequest ) -> Data? {
        guard let parts = (request.url?.pathComponents),
            let method = request.httpMethod,
            let direction = MockDirection(rawValue: method)
            else { return nil }
        
        let suffix = parts.suffix(2).map{ i in return i}
        let actions = direction.kind(suffix)
        guard let loadJSON = index(actions[0], action: actions[1]) else { return nil }
        
        return loadJSON.data(using: String.Encoding.utf8)
    }
}
