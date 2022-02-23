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
    var vc: UIViewController
}

final class MOCDataService {
    let articles: [Article]
    
    init() {
        self.articles = MOCArticles
    }
}

private let MOCArticles = [articleMOSCard, articleMinor, articleLMS, articleCofe, articleCov]

private let articleMOSCard = Article(
    themeModel: ThemeModel(
        themeName: "Карта Москвича",
        additionalInf: "Как можно скорее",
        image: .init(named: "moskartamini")),
    themesModel: ThemesModel(
        mainImage: .init(named: "moskartamini"),
        mainInfo: "Карта Москвича - социальная карта",
        aboutInfo: "Как сделать льготный проезд в метро и на наземном транстпорте? И Не только!!! Читай в нашей статье",
        article: ["Как оформить", "Как использовать", "Плюшки", "Что-то еще", "Что-то еще"]
    ),
    vc: MosCardViewController()
)

private let articleLMS = Article(
    themeModel: ThemeModel(
        themeName: "Все о ЛМС и Смарт ЛМС",
        additionalInf: nil,
        image: .init(named: "LMSLight")),
    themesModel: ThemesModel(
        mainImage: .init(named: "LMSBig"),
        mainInfo: "Все, что нужно знать о ЛМС и Смарт ЛМС",
        aboutInfo: "Как войти? как использовать? Почему так плохо?) Узнаете ответы на все вопросы уже в этой статье!",
        article: ["Как зайти", "Как использовать", "Плюшки", "Что-то еще", "Что-то еще"]
    ),
    vc: UIViewController()
)

private let articleMinor = Article(
    themeModel: ThemeModel(
        themeName: "Майнор - Выбираем лучший",
        additionalInf: nil,
        image: .init(named: "minor")),
    themesModel: ThemesModel(
        mainImage: .init(named: "moskartamini"),
        mainInfo: "Майноры",
        aboutInfo: "Что такое майнор? Как его выбрать и не прогадать?",
        article: ["Что такое майнор", "Выбираем свой майнор", "Плюшки", "Что-то еще", "Что-то еще"]
    ),
    vc: UIViewController()
)

private let articleCofe = Article(
    themeModel: ThemeModel(
        themeName: "Лучший кофе - где он",
        additionalInf: nil,
        image: .init(named: "cofeLight")),
    themesModel: ThemesModel(
        mainImage: .init(named: "cofeBig"),
        mainInfo: "Майноры",
        aboutInfo: "Что такое майнор? Как его выбрать и не прогадать?",
        article: ["Что такое майнор", "Выбираем свой майнор", "Плюшки", "Что-то еще", "Что-то еще"]
    ),
    vc: UIViewController()
)

private let articleCov = Article(
    themeModel: ThemeModel(
        themeName: "Коворкинги",
        additionalInf: "Самые интересные",
        image: .init(named: "kovorkingLight")),
    themesModel: ThemesModel(
        mainImage: .init(named: "kovorkingBig"),
        mainInfo: "Майноры",
        aboutInfo: "Что такое майнор? Как его выбрать и не прогадать?",
        article: ["Что такое майнор", "Выбираем свой майнор", "Плюшки", "Что-то еще", "Что-то еще"]
    ),
    vc: UIViewController()
)
