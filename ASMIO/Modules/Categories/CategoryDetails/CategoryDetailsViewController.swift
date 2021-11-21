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
            categoryProductsCollectionView.prefetchDataSource = self
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
        viewModel.reloadData = { [weak self] in
            self?.categoryProductsCollectionView.reloadData()
        }
    }
    @IBAction func searchViewTapGestureRecognized(_ sender: Any) {
    }
    @IBAction func backButtonTapped(_ sender: Any) {
    }
    @IBAction func sortButtonTapped(_ sender: Any) {
        let sortViewController = SortViewController()
        sortViewController.delegate = self
        sortViewController.selectedOption = viewModel.sortingOption
        sortViewController.modalTransitionStyle = .coverVertical
        sortViewController.modalPresentationStyle = .overCurrentContext
        present(sortViewController)
    }
    @IBAction func filterButtonTapped(_ sender: Any) {
    }
    
}

extension CategoryDetailsViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        push(ProductDetailsViewController(productId: viewModel.sortedProducts[indexPath.row].id ?? 1))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = collectionView.frame.width
        return CGSize(width: collectionWidth/2 - 13, height: 225)
    }
}

extension CategoryDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = viewModel.sortedProducts.count
        if count == 0 {
            collectionView.setEmptyView(title: "", message: "No Products Found")
        }else {
            collectionView.restore()
        }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(indexPath: indexPath) as ProductCollectionViewCell
        cell.configure(with: viewModel.sortedProducts[indexPath.row])
        return cell
    }
}


extension CategoryDetailsViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        if indexPaths.last?.row == viewModel.sortedProducts.count - 1,
           viewModel.shouldPaginate {
            viewModel.fetchProducts()
        }
    }
}

extension CategoryDetailsViewController: SortDelegate {
    func didSelect(sortOption: SortOptions) {
        dismiss()
        viewModel.sortingOption = sortOption
    }
    
}
