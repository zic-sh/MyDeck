// The Swift Programming Language
// https://docs.swift.org/swift-book

import MyShuffle
import MyCard

public struct MyDeck {
    fileprivate var cards: [MyCard]

    public static func standard52CardDeck() -> MyDeck {
        let suits: [Suit] = [.spades, .hearts, .diamonds, .clubs]
        let ranks: [Rank] = [.two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king, .ace]

        var cards: [MyCard] = []
        for rank in ranks {
            for suit in suits {
                cards.append(MyCard(rank: rank, suit: suit))
            }
        }

        return MyDeck(cards)
    }

    public init(_ cards: [MyCard]) {
        self.cards = cards
    }

    public mutating func shuffle() {
        cards.shuffle()
    }

    public mutating func deal() -> MyCard? {
        guard !cards.isEmpty else { return nil }

        return cards.removeLast()
    }
}

// MARK: - ExpressibleByArrayLiteral

extension MyDeck : ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: MyCard...) {
        self.init(elements)
    }
}

// MARK: - Equatable

extension MyDeck : Equatable {}

public func ==(lhs: MyDeck, rhs: MyDeck) -> Bool {
    return lhs.cards == rhs.cards
}
