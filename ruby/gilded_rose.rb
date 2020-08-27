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

  def increase_quality
    self.quality += 1 if quality < 50
  end

  def decrease_quality
    self.quality -= 1 if quality > 0
  end
  def age
      self.sell_in -= 1 if name != "Sulfuras, Hand of Ragnaros"
  end

  def update
      if name != "Aged Brie" and name != "Backstage passes to a TAFKAL80ETC concert"
        if quality > 0
          if name != "Sulfuras, Hand of Ragnaros"
            decrease_quality
          end
        end
      else
          increase_quality
          if name == "Backstage passes to a TAFKAL80ETC concert"
            if sell_in < 11
                increase_quality
              end
            end
            if sell_in < 6
                increase_quality
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
                decrease_quality
              end
            end
          else
            self.quality -= item.quality
          end
        else
            increase_quality
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
