//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Ivan on 08.04.2025.
//

import UIKit

/// Controller to show and search for Characters
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Characters"
        test()
    }
    
    private func test() {
        
        print(String(describing: RMRequest.listCharactersRequest.url))
        RMService.shared.execute(RMRequest.listCharactersRequest, expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print(String(describing:model))
            case .failure(let error):
                print(error)
            }
        }
    }
}
