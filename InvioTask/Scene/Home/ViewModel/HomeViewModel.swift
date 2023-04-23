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
    
    
    var getCharactersId: [Int]? //tıklanan karakterli tutmak için oluşturulan array.
    
    
    
    //For lazy load.
    var currentPage = 1
    var isLoading :Bool = false
    
    
    func getLocationItems(page: Int) {
        print("page :", page)
        isLoading = true
        
        networkManager.getLocations(page: currentPage) {  locations, error in
            
            if let error = error {
                print("Hata oluştu: \(error.localizedDescription)")
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
        
        //değişebilir.
        networkManager.getCharactersById(characterIds: getCharactersId! ) { character, error in
            
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
    
    
    
}





