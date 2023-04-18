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
    let selectedLabelColor = UIColor(named: "green") // Seçili hücrenin label rengi
    let defaultLabelColor = UIColor.black // Varsayılan label rengi
    
    var isLoading = false
    
    
    var locations: [Location] = []
    var charachter: [Character] = []
    
    
    //tıklanan lokaston idsi.
    //var selectedLocationId: Int?
    
    var getLocationClicked: Location?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCellNibs()
        returnViewModel()
        
    }
    
    
    fileprivate func returnViewModel(){
        ProgressHUD.show()
        viewModel.getCharacterItems()
        viewModel.getLocationItems()
        
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
            
            if indexPath.item == locations.count && isLoading {
                // cell.activityIndicator.startAnimating()
                    //indicator eklenecektirr..
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
            //cell.setupCharactersList(character: charachter[indexPath.row])
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
            // print("Clicked : ", viewModel.charactersData[indexPath.row])
            navigationController?.pushViewController(controller, animated:true)
            
        } else if collectionView == locationsCollectionView {
            
            viewModel.locationClicked = viewModel.locationsData[indexPath.row]
            viewModel.getCharacterId() //tıklandığın bu fonksiyon çağrılarak resisten idler bir başka arraya alınacaktır.
            
            print("viewModel.getCharacterId() : ",viewModel.getCharacterId())
            print("viewModel.locationClicked :", viewModel.locationClicked)
            
            viewModel.getCharactersById()
            
            //characterCollectionView.reloadData()
            collectionView.reloadData()
            
            
        }
    }
    
    
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let endScrolling = scrollView.contentOffset.x + scrollView.frame.width
        if endScrolling >= scrollView.contentSize.width {
            //Son hücre görüntülendi, bir sonraki sayfayı yükleyin
            viewModel.loadNextPage()
        }
    }
    
    
    
}
