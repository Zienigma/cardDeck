void main() {
  var deck = new Deck();
	
  deck.removeCard('Ace', 'Diamonds');
  print(deck);
}
class Deck {

  List<Card> cards = [];

  Deck() {
    var ranks = ['Ace', 'Two', 'Three', 'Four', 'Five'];
    var suits = ['Spades', 'Hearts', 'Clubs', 'Diamonds'];

    for (var suit in suits) {
      for (var rank in ranks) {
        var card = new Card(
          rank: rank,
          suit: suit,
        );
        cards.add(card);
      }
    }
  }

  toString() {
    return cards.toString();
  }

  shuffle() {
    cards.shuffle();
  }
  
  cardsWithSuit(String suit) {
    return cards.where((card) => card.suit == suit);
  }
  
  deal(int handSize) {
    var hand = cards.sublist(0, handSize);
    cards = cards.sublist(handSize);
    
    return hand;
  }

  removeCard(String rank, String suit) {
    cards.removeWhere((card) => (card.suit == suit) && (card.rank == rank));
    }
  }

class Card {
  String suit;
  String rank;

  Card({this.rank, this.suit});

  toString() {
    return '$rank of $suit';
  }
}