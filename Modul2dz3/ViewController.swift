

import UIKit

class ViewController: UIViewController {
// Коллекцию создаём когда много элементов на одной вью и когда много данных нужно получать 
//  Коллекция это наследеник от скролла и значит он обладает всеми делегатами скролла
//    lazy var testText: UITextField = {
//        $0.settingTextField(placeholder: "Surname", radius: 30) // а такми образом записываем часто изменяющийся параметр
//        $0.isSecureTextEntry = true // и пишем нижу нужное нам новое значение
//        return $0
//    }(UITextField())
//    Таким образом мы экономим очень много кода и для одинаковых элементов можем писать extension
    
    let collectionData = SlideItemModel.mockData()
    
    lazy var collectionView: UICollectionView = {
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout // достём layout этой коллекции (UICollectionView), а layout этой коллекции является объектом UICollectionViewFlowLayout и явно кастим его до UICollectionViewFlowLayout, так как в collectionViewLayout приходит объект UICollectionViewLayout и по этому нам надо явно сказать что это родитель
        layout.scrollDirection = .horizontal // определили направление скролла
        layout.minimumLineSpacing = 1 // этот параметр и нижний это отступы (боковой)
        layout.minimumInteritemSpacing = 10 // верх низ
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height) //таким образом пишем если точно знаем размеры или это квадратная ячейка, важный момент, если скролл по горизонтали он пытается заполнить по вертикали, а если скролл делаем вертикальным он пытается заполнить по горизонтали
        //layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize когда не знаем размера ячеек
        
        //ниже начинаем работать с самой ячейкой
        $0.register(SlideHorizCell.self, forCellWithReuseIdentifier: SlideHorizCell.reuseId) // зарегистрировали нашу ячейку
        $0.isPagingEnabled = true
        $0.dataSource = self
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: UICollectionViewFlowLayout())) // collectionViewLayout - это такой документ надстроек над нашей коллекцией, UICollectionViewFlowLayout - всегда используем этот элемент он позволяет настроить размеры
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionView)

    }
}

extension ViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlideHorizCell.reuseId, for: indexPath) as! SlideHorizCell
        let item = collectionData[indexPath.item]
        cell.configCell(item: item)
        
        if indexPath.item == collectionData.count-1{
            cell.addCenter()
        }
    return cell
    }
}
