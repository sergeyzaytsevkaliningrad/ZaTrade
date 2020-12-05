import Foundation

final class ShowProductPresenter {
    var view: ShowProductViewController?
    var model = ProductModel(ProductName: "MacBook Pro 13" ,
                                  ProductPrice: 250000.0,
                                  ProductDescription: "Процессор 2,4 ГГц, 8‑ядерный Intel Core i9, ускорение Turbo Boost до 5,0 ГГц, 16 МБ кэш‑памяти третьего уровня 32 ГБ или 64 ГБ памяти DDR4 2666 МГц Графический процессор AMD Radeon Pro 5500M с 4 ГБ памяти GDDR6. Графический процессор AMD Radeon Pro 5500M с 8 ГБ памяти GDDR6.", ProductTypeTax: false)
    
    
    @objc func showEdit() {
        let vc = AddProductViewController(isEditingView: true)
        self.view!.navigationController?.pushViewController(vc, animated: true)
        vc.presenter.model = self.model
    }
    
}
