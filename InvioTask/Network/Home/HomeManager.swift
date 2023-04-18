//
//  HomeManager.swift
//  InvioTask
//
//  Created by Kenan Baylan on 14.04.2023.
//

import Foundation


protocol HomeManagerProtocol {
    func getLocations(complete: @escaping((LocationResponse?, Error?)->()))
    func getCharacters(complete: @escaping((CharacterResponse?, Error?)->()))
    func getCharactersById(complete: @escaping((CharacterResponse?, Error?)->()))
    
}



class HomeManager: HomeManagerProtocol {
    
    
    static let shared = HomeManager()
    
    var characterIDs: [Int] = []
    //tüm lokasyonların idleri alındı. ardından ardından tıklana lokasyonun
    
    
    func getLocations(complete: @escaping ((LocationResponse?, Error?) -> ())) {
        NetworkService.shared.request(type: LocationResponse.self, url: HomeEndpoint.getLocations.path, method: .get) { response in
            
            switch response {
            case .success(let locationResponse):
                let characterURLs = locationResponse.locations.flatMap { $0.residents }
                
                let ids = characterURLs.compactMap { Int($0.components(separatedBy: "/").last ?? "") }
                self.characterIDs.append(contentsOf: ids)
                
                //  print("characterIDs : ", self.characterIDs)
                complete(locationResponse, nil)
                
            case .failure(let error):
                print("hata çıktııı.")
                complete(nil, error)
            }
        }
        
    }
    
    
    
    func getCharacters(complete: @escaping ((CharacterResponse?, Error?) -> ())) {
        NetworkService.shared.request(type: CharacterResponse.self, url: HomeEndpoint.getCharacters.path, method: .get) { response in
            do {
                switch response {
                case .success(let characterResponse):
                    print("characterResponse: ", characterResponse.results.count)
                    complete(characterResponse,nil)
                    
                case .failure(let error):
                    print("hata çıktııı. GetCharacters")
                    complete(nil, error)
                }
                
            } catch {
                print("handleResponse hata cikti: ", error)
                complete(nil, error)
            }
        }
    }
    
    
    func getCharactersById(complete: @escaping ((CharacterResponse?, Error?) -> ())) {
        
        
        if let characterIds = HomeViewModel.shared.getCharacterId() {
            let characterIdString = characterIds.map(String.init).joined(separator: ",")
            let url = HomeEndpoint.getCharactersById.path + characterIdString
            //url kullanarak isteği gerçekleştirebilirsiniz.
            
            NetworkService.shared.request(type: CharacterResponse.self, url: url , method: .get) { response in
                
                do {
                    switch response {
                    case .success(let characterResponse):
                        print("getCharactersById Response: ", characterResponse.results.count)
                        complete(characterResponse,nil)
                        
                    case .failure(let error):
                        print("hata çıktııı. getCharactersById")
                        complete(nil, error)
                    }
                    
                } catch {
                    print("handleResponse hata cikti: ", error)
                    complete(nil, error)
                }
            }
        } else {
            //hata durumunda burası çalışır
            print("getCharactersById hata varr...");
        }
        
        
    }
    
}

