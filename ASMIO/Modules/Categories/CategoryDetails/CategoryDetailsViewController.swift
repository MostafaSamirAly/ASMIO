//
//  CategoryDetailsViewController.swift
//  ASMIO
//
//  Created by Mostafa Samir on 17/11/2021.
//

import UIKit

class CategoryDetailsViewController: BaseViewController {
    @IBOutlet weak var categoryProductsCollectionView: UICollectionView! {
        didSet {
            categoryProductsCollectionView.delegate = self
            categoryProductsCollectionView.dataSource = self
            categoryProductsCollectionView.registerCellNib(cellClass: ProductCollectionViewCell.self)
        }
    }
    
    private let viewModel = CategoriesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViewModel()
        viewModel.fetchProducts()
    }
    
    func setupViewModel() {
        setupViewModel(viewModel: viewModel)
        viewModel.fetchProductsSuccess = { [weak self] in
            self?.categoryProductsCollectionView.reloadData()
        }
    }
    @IBAction func searchViewTapGestureRecognized(_ sender: Any) {
    }
    @IBAction func backButtonTapped(_ sender: Any) {
    }
    @IBAction func sortButtonTapped(_ sender: Any) {
    }
    @IBAction func filterButtonTapped(_ sender: Any) {
    }
    
}

extension CategoryDetailsViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = collectionView.frame.width
        return CGSize(width: collectionWidth/2 - 13, height: 225)
    }
}

extension CategoryDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = viewModel.products.count
        if count == 0 {
            collectionView.setEmptyView(title: "", message: "No Products Found")
        }else {
            collectionView.restore()
        }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(indexPath: indexPath) as ProductCollectionViewCell
        cell.configure(with: viewModel.products[indexPath.row])
        return cell
    }
}
