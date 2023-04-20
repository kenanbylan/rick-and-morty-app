//
//  HomeViewController.swift
//  InvioTask
//
//  Created by Kenan Baylan on 10.04.2023.


import UIKit
import ProgressHUD

//C: compact küçük.
//R: regular büyük.

class HomeViewController: UIViewController {
    
    static let shared = HomeViewController()
    
    
    let viewModel = HomeViewModel()
    
    
    //MARK: UIElements
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var locationsCollectionView: UICollectionView!
    @IBOutlet weak var characterCollectionView: UICollectionView!
    
    
    //MARK: Variables
    var selectedIndexPath: IndexPath? // Seçili hücrenin indeksi
    let selectedLabelColor = UIColor.systemGreen // Seçili hücrenin label rengi
    let defaultLabelColor = UIColor.black // Varsayılan label rengi
    
    
    
    
    
    var charachter: [Character] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCellNibs()
        returnViewModel()
        
    }
    
    
    fileprivate func returnViewModel(){
        ProgressHUD.show()
        
        DispatchQueue.main.async {
            self.viewModel.getCharacterItems()
            self.viewModel.getLocationItems(page: self.viewModel.currentPage)
        }
        
        
        viewModel.errorCallback = { [weak self] errorMessage in
            print("errorMessage :", errorMessage)
        }
        
        
        viewModel.successCallback = { [weak self] in
            
            self?.locationsCollectionView.reloadData()
            self?.characterCollectionView.reloadData()
            ProgressHUD.dismiss()
        }
        
        viewModel.coordinator = HomeCoordinator(navigationController: navigationController ?? UINavigationController())
        
    }
    
    private func registerCellNibs() {
        
        let locationNibName = LocationsCollectionViewCell.identifier
        locationsCollectionView.register(UINib(nibName: locationNibName, bundle: nil), forCellWithReuseIdentifier: locationNibName)
        
        let characterNibname = CharactersCollectionViewCell.identifier
        characterCollectionView.register(UINib(nibName: characterNibname, bundle: nil), forCellWithReuseIdentifier: characterNibname)
        
    }
}


extension HomeViewController: UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case locationsCollectionView:
            
            return viewModel.locationsData.count
            
        case characterCollectionView:
            return viewModel.charactersData.count
            
        default:
            return 0
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
            //MARK: -bu kısmı geliştir ayrı bir class olarak ayarla dolabilir.
        case locationsCollectionView:
            let locationCellIdentifier = LocationsCollectionViewCell.identifier
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: locationCellIdentifier, for: indexPath) as! LocationsCollectionViewCell
            
            cell.setupLocations(locations: viewModel.locationsData[indexPath.row])
            if indexPath.item == viewModel.locations.count - 1  && !viewModel.isLoading {
                
                viewModel.currentPage += 1
                viewModel.getLocationItems(page: viewModel.currentPage)
                
            }
            
            // Seçili hücrenin label rengini değiştir
            if indexPath == selectedIndexPath {
                cell.locationLabel.textColor = selectedLabelColor
                //!characterCollectionView.reloadData() hata olabilir
            } else {
                if traitCollection.userInterfaceStyle == .dark {
                    cell.locationLabel.textColor = .white
                    
                } else {
                    cell.locationLabel.textColor = .black
                }
            }
            return cell
            
        case characterCollectionView:
            let characterCellIdentifier = CharactersCollectionViewCell.identifier
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: characterCellIdentifier, for: indexPath) as! CharactersCollectionViewCell
            
            cell.setupCharactersList(character: viewModel.charactersData[indexPath.row])
            
            return cell
            
            
        default:
            return UICollectionViewCell()
            
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == characterCollectionView {
            
            let controller = CharacterDetailViewController.instantiate()
            controller.character = collectionView == characterCollectionView ? viewModel.charactersData[indexPath.row] : nil
            navigationController?.pushViewController(controller, animated:true)
            
        } else if collectionView == locationsCollectionView {
            
            DispatchQueue.main.async {
                
                self.selectedIndexPath = indexPath //tıklanan indexPathe göre renk değiştirme işlemi yaptık.
                self.viewModel.locationClicked = self.viewModel.locationsData[indexPath.row]
                
                let characterURLs = self.viewModel.locationsData[indexPath.row]
                
                let characterIDs = characterURLs.residents.compactMap { url -> Int? in
                    
                    // URL'yi bölüp karakter ID'sini alın
                    let components = url.split(separator: "/")
                    return Int(components.last ?? "")
                    
                }
                if characterIDs.isEmpty {
                    self.viewModel.getCharactersId = [] // getCharactersId array'inin içini boş bir array ile güncelle
                    collectionView.reloadData() // collectionView'ı yenile
                    
                } else {
                    self.viewModel.getCharactersId = characterIDs //tıklanan karakter idler alındı.
                    self.viewModel.getCharacterItemsById()
                }
                
                
                
            }
        }
        collectionView.reloadData()
        
    }
    
    
    
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            loadNewPage()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        loadNewPage()
    }
    
    
    //for lazy load
    private func loadNewPage() {
        let offsetY = locationsCollectionView.contentOffset.y
        let contentHeight = locationsCollectionView.contentSize.height
        let screenHeight = locationsCollectionView.frame.size.height
        if offsetY > contentHeight - screenHeight {
            viewModel.currentPage += 1
            viewModel.getLocationItems(page: viewModel.currentPage)
        }
    }
    
    
    
}





