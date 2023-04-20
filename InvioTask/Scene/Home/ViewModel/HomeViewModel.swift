//  HomeViewModel.swift
//  InvioTask
//  Created by Kenan Baylan on 17.04.2023.


//result.location.url= bu kısımdaki urlin en sonundaki değerleri alıp ayrı bir dizide tutacağız.
//result.name


import Foundation
import UIKit
import Alamofire

class HomeViewModel {
    
    static let shared = HomeViewModel()
    
    var coordinator: HomeCoordinator?
    let networkManager = HomeManager.shared
    
    
    var locationsData = [Location]()
    var charactersData = [Character]() // buradaki değişiklik yapıldı
    
    //tıklanan location objesi.
    var locationClicked: Location?
    
    var errorCallback: ((String)->())?
    var successCallback: (()->())?
    
    
    var getCharactersId: String?
    
    
    func getLocationItems() {
        
        networkManager.getLocations { locations, error in
            
            if let error = error {
                print("Hata oluştu: \(error.localizedDescription)")
                self.errorCallback?(error.localizedDescription)
            } else {
                if let locations = locations {
                    self.locationsData = locations.locations
                }
            }
            self.successCallback?()
        }
    }
    
    
    func getCharacterItems() {
        networkManager.getCharacters { character, error in
            if let error = error {
                print("Hata oluştu getCharacterItems : \(error.localizedDescription)")
                self.errorCallback?(error.localizedDescription)
                
            } else {
                
                if let character = character {
                    //print("Characterss ViewModel : ", character.results[0])
                    self.charactersData = character.results
                }
            }
            self.successCallback?()
        }
    }
    
    
    
    func getCharacterItemsById()  {
        
        print("getCharactersId :" , getCharactersId)
        
        
        networkManager.getCharactersById(characterIds: getCharactersId ?? "31,2,3,4") { character, error in
            
            if let error = error {
                print("Hata oluştu getCharacterItems : \(error)")
                self.errorCallback?(error.localizedDescription)
                
            } else {
                if let character = character {
                    print(" getCharacterItemsById results : ",   character)
                    self.charactersData = character
                }
            }
            self.successCallback?()
            
        }
    }
    
    
    func loadNextPage() {
        
        // loading hücresi koleksiyon görünümüne
        //  homeViewController.isLoading = true
        //  homeViewController.locationsCollectionView.reloadData()
        
        //API isteği yapın
        //        APIManager.shared.getLocations(page: self.page) { result in
        //            switch result {
        //            case .success(let locations):
        //                self.page += 1
        //                // Verileri koleksiyon görünümüne ekleme
        //                self.locations.append(contentsOf: locations)
        //                // loading hücresini koleksiyondan kaldırın
        //                self.isLoading = false
        //                self.collectionView.reloadData()
        //            case .failure(let error):
        //                print(error)
        //            }
        //        }
    }
    
    
}
