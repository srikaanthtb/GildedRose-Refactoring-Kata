require 'delegate'
class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      ItemWrapper.new(item).update
    end
  end
class ItemWrapper < SimpleDelegator

  def update
      if name != "Aged Brie" and name != "Backstage passes to a TAFKAL80ETC concert"
        if quality > 0
          if name != "Sulfuras, Hand of Ragnaros"
            self.quality -= 1
          end
        end
      else
        if quality < 50
          quality = quality + 1
          if name == "Backstage passes to a TAFKAL80ETC concert"
            if sell_in < 11
              if quality < 50
                self.quality += 1
              end
            end
            if sell_in < 6
              if quality < 50
                self.quality += 1
              end
            end
          end
        end
      end
      if item.name != "Sulfuras, Hand of Ragnaros"
        self.sell_in -= 1
      end
      if item.sell_in < 0
        if name != "Aged Brie"
          if name != "Backstage passes to a TAFKAL80ETC concert"
            if quality > 0
              if name != "Sulfuras, Hand of Ragnaros"
                self.quality -= 1
              end
            end
          else
            self.quality -= item.quality
          end
        else
          if quality < 50
            self.quality += 1
          end
        end
      end
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
