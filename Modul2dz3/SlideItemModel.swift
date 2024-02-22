

import UIKit // в правильно моделе UIKit не используется

struct SlideItemModel{
    
    let id = UUID().uuidString //автоматически присваивает случайную строку, это нужно что бы был уникальный ID
    var image: String //сюда будем передовать имя изображения
    var title: String
    var color: UIColor
    
    static func  mockData() -> [SlideItemModel]{ //здесь мы написали что у нас есть мок данные которые возвращают массив из этой структуры
        return[
            SlideItemModel(image: "imeg1", title: "Первый экран один текст", color: .black),
            SlideItemModel(image: "image2", title: "Второй экран другой текст", color: .black),
            SlideItemModel(image: "image3", title: "Третий экран новый текст", color: .white),
            SlideItemModel(image: "image_one", title: "Тут старая картинка", color: .white),
            SlideItemModel(image: "ps4slim", title: "Картинка с прошлого проекта", color: .black),
            SlideItemModel(image: "ps5", title: "Тут немного больше текста для переноса строки", color: .black),
        ]
    }
}
