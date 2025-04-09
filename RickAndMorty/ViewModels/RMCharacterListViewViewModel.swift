//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Ivan on 09.04.2025.
//

import UIKit

final class RMCharacterListViewViewModel: NSObject {
    
    func fetchCharacters() {
        print(String(describing: RMRequest.listCharactersRequest.url))
        RMService.shared.execute(RMRequest.listCharactersRequest,
                                 expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print(String(describing:model))
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension RMCharacterListViewViewModel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier,
            for: indexPath) as? RMCharacterCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let testURL = URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
        let viewModel = RMCharacterCollectionViewCellViewModel(characterName: "Test",
                                                               characterStatus: .alive,
                                                               characterImageUrl: testURL)
        cell.configure(with: viewModel)
        return cell
    }
}

extension RMCharacterListViewViewModel: UICollectionViewDelegate { }

extension RMCharacterListViewViewModel: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30)/2
        return CGSize(width: width, height: width*1.5)
    }
}
