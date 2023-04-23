//  HomeViewModel.swift
//  InvioTask
//  Created by Kenan Baylan on 17.04.2023.

import Foundation
import UIKit
import Alamofire

class HomeViewModel {
    
    static let shared = HomeViewModel()
    
    //MARK: Properties or Variables.
    var coordinator: HomeCoordinator?
    let networkManager = HomeManager.shared
    
    var locationsData = [Location]()
    var charactersData = [Character]()
    
    

    var errorCallback: ((String)->())?
    var successCallback: (()->())?
    
    var getCharactersId: [Int]? //array created to kepp clicked characters ID.
    
    //For lazy load.
    var currentPage = 1
    var isLoading :Bool = false
    
    
    func getLocationItems(page: Int) {
        
        isLoading = true
        
        networkManager.getLocations(page: currentPage) {  locations, error in
            if let error = error {
                self.errorCallback?(error.localizedDescription) //
                
            } else {
                if let locations = locations {
                    self.isLoading = false
                    self.locationsData.append(contentsOf: locations.locations)
                }
            }
            self.successCallback?() //succes dönerse collectionView.reloadData() yapılacak
        }
        
    }
    
    
    func getCharacterItems() {
        networkManager.getCharacters(id: "") { character, error in
            if let error = error {
                print("Error getCharacterItems : \(error.localizedDescription)")
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
    
    
    func getCharacterItemsById() {
        networkManager.getCharactersById(characterIds: getCharactersId! ) { character, error in
            if let error = error {
                self.errorCallback?(error.localizedDescription)
            } else {
                
                if let character = character {
                    self.charactersData = character
                }
            }
            
            self.successCallback?()
        }
    }
    
    
    
}





