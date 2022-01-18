//
//  MOCData.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 18.01.2022.
//

import UIKit

struct Article {
    var themeModel: ThemeModel
    var themesModel: ThemesModel
}

final class MOCDataService {
    let articles: [Article]
    
    init() {
        self.articles = MOCArticles
    }
}

private let MOCArticles = [ArticleMOSCard, ArticleLMS]

private let ArticleMOSCard = Article(
    themeModel: ThemeModel(
        themeName: "Карта Москвича",
     additionalInf: "Как можно скорее",
     image: UIImage.init(named: "moskartamini")),
    themesModel: ThemesModel(
        mainImage: UIImage.init(named: "moskartamini"),
        mainInfo: "Карта Москвича - социальная карта",
        aboutInfo: "Как сделать льготный проезд в метро и на наземном транстпорте? И Не только!!! Читай в нашей статье",
        article: ["Как оформить", "Как использовать", "Плюшки", "Что-то еще", "Что-то еще"]
    )
)

private let ArticleLMS = Article(
    themeModel: ThemeModel(
        themeName: "Все о ЛМС и Смарт ЛМС",
     additionalInf: nil,
     image: nil),
    themesModel: ThemesModel(
        mainImage: nil,
        mainInfo: "Все, что нужно знать о ЛМС и Смарт ЛМС",
        aboutInfo: "Как войти? как использовать? Почему так плохо?) Узнаете ответы на все вопросы уже в этой статье!",
        article: ["Как зайти", "Как использовать", "Плюшки", "Что-то еще", "Что-то еще"]
    )
)


