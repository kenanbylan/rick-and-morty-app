//
//  HomeManager.swift
//  InvioTask
//
//  Created by Kenan Baylan on 14.04.2023.
//

import Foundation


protocol HomeManagerProtocol {
    func getLocations(page: Int, complete: @escaping((LocationResponse?, Error?)->()))
    func getCharacters(id: String, complete: @escaping((CharacterResponse?, Error?)->()))
    func getCharactersById(characterIds: [Int], complete: @escaping(([Character]?, Error?)->()))
}



class HomeManager: HomeManagerProtocol {
    
    
    static let shared = HomeManager()
    
    //let viewModel = HomeViewModel() //hata çıkabilir?
    
    var characterIDs: [Int] = [] //tüm lokasyonların idleri alındı. ardından ardından tıklana lokasyonun
    
    
    func getLocations(page: Int, complete: @escaping ((LocationResponse?, Error?) -> ())) {
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
    
    
    
    func getCharacters(id: String, complete: @escaping ((CharacterResponse?, Error?) -> ())) {
        
        NetworkService.shared.request(type: CharacterResponse.self, url: HomeEndpoint.getCharacters.path + id, method: .get) { response in
            
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
    
    func getCharactersById(characterIds: [Int] ,complete: @escaping (([Character]?, Error?) -> ())) {
        
        
        
        
        //tek bir array de geliyorsa farklı bir model yazmak istedim.
        if characterIds.count == 1 {
            
            print("characterIds : ", characterIds)
            
            let url = HomeEndpoint.getCharactersById.path + String(characterIds[0])
            print("url : ", url)
            
            NetworkService.shared.request(type: Character.self, url: url, method: .get) { response in
                do {
                    switch response {
                    case .success(let characterResponse):
                        // Gelen yanıtı bir dizi içinde döndür
                        complete([characterResponse], nil)
                        
                        
                    case .failure(let error):
                        print("hata çıktııı. GetCharacters", error.localizedDescription)
                        complete(nil, error)
                    }
                } catch {
                    print("handleResponse hata cikti: ", error)
                    complete(nil, error)
                }
            }
            
            
            
        } else if characterIds.isEmpty {
            
            
            complete(nil, nil)
            return

            
        }
        
        else {
            let characterIDString = characterIds.map { String($0) }.joined(separator: ",")
            
            let url = HomeEndpoint.getCharactersById.path + characterIDString
            print("url : ", url)
            
            
            NetworkService.shared.request(type: [Character].self, url: url, method: .get) { response in
                
                do {
                    switch response {
                    case .success(let characterResponse):
                        
                        //æ print("characterResponse313131: ", characterResponse.results.count)
                        complete(characterResponse ,nil)
                        
                    case .failure(let error):
                        print("hata çıktııı. GetCharacters", error)
                        complete(nil, error)
                    }
                    
                } catch {
                    print("handleResponse hata cikti: ", error)
                    complete(nil, error)
                }
            }
            
        }
        
    }
    
}

