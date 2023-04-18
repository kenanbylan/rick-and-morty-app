//  HomeViewModel.swift
//  InvioTask
//  Created by Kenan Baylan on 17.04.2023.




//result.location.url= bu kısımdaki urlin en sonundaki değerleri alıp ayrı bir dizide tutacağız.
//result.name


import Foundation
import UIKit


class HomeViewModel {
    
    let homeViewController = HomeViewController()
    
    var coordinator: HomeCoordinator?
    let networkManager = HomeManager.shared
    
    
    var locationsData = [Location]()
    var charactersData = [Character]() // buradaki değişiklik yapıldı
    
    
    //tıklanan location objesi.
    var locationClicked: Location?
    
    
    var errorCallback: ((String)->())?
    var successCallback: (()->())?
    
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
        }
    }
    
    
    //Karakter idleri alınıp return olarak bir string döndürülür.
    func getCharacterId() -> String? {  //tıklandığı zaman çalıştırılması gereken bir fonksiyondur.
        
        // `viewModel.locationClicked` içindeki karakter URL'lerini alın
        guard let characterURLs = locationClicked?.residents else { print("hata verdi222.");  return  nil }
        
        // Karakter URL'lerini bir diziye dönüştürün ve karakter ID'lerini elde edin
        let characterIDs = characterURLs.compactMap { url -> Int? in
            // URL'yi bölüp karakter ID'sini alın
            let components = url.split(separator: "/")
            return Int(components.last ?? "")
        }
        
        // Karakter ID'lerini virgülle ayrılmış bir string olarak birleştirin
        let characterIDString = characterIDs.map { String($0) }.joined(separator: ",")
        return characterIDString
    }
    

    func getCharactersById() {
        
        networkManager.getCharactersById { charactersById, error in
            if let error = error {
                print("Hata oluştu getCharacterItems : \(error.localizedDescription)")
                self.errorCallback?(error.localizedDescription)
                
            } else {
                
                if let charactersById = charactersById {
                    //print("Characterss ViewModel : ", character.results[0])
                    self.charactersData = charactersById.results
                }
            }
        }
    }
    
    
    func loadNextPage() {
        // loading hücresi koleksiyon görünümüne
        
        homeViewController.isLoading = true
        homeViewController.locationsCollectionView.reloadData()

        //API isteği yapın
        APIManager.shared.getLocations(page: self.page) { result in
            switch result {
            case .success(let locations):
                self.page += 1
                // Verileri koleksiyon görünümüne ekleme
                self.locations.append(contentsOf: locations)
                // loading hücresini koleksiyondan kaldırın
                self.isLoading = false
                self.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }

    
}
