# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "json"
require "net/http"
require "uri"
require 'date'

uri = URI.parse("http://mtgjson.com/json/RAV-x.json")

http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Get.new(uri.request_uri)

response = http.request(request)

if response.code == "200"
    parsed = JSON.parse(response.body)

    card_set = CardSet.create(name: parsed["name"],
                              code: parsed["code"],
                              borderColor: parsed["border"],
                              releaseDate: Date.parse(parsed["releaseDate"]),
                              set_type: parsed["type"],
                              block: parsed["block"])

    parsed["cards"].each do |card|
        card.default = nil
        card_record = Card.create(layout: card["layout"],
                                  card_type: card["type"],
                                  cmc: card["cmc"],
                                  rarity: card["rarity"],
                                  artist: card["artist"],
                                  power: card["power"],
                                  toughness: card["toughness"],
                                  manaCost: card["manaCost"],
                                  text: card["text"],
                                  flavor: card["flavor"],
                                  number: card["number"],
                                  watermark: card["watermark"])

        Printing.create(id: card["multiverseId"],
                        card_id: card_record.id,
                        cardSet_id: card_set.id)
    end
end