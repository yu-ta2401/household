class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '___' },
    { id: 2, name: '冷蔵庫' },
    { id: 3, name: 'レンジ' },
    { id: 4, name: 'エアコン' },
    { id: 5, name: '洗濯機' },
    { id: 6, name: '炊飯器' },
    { id: 7, name: '掃除機' },
    { id: 8, name: '扇風機' },
]
end

# class Item < ApplicationRecord
#   has_many :items
#   has_ancestry

#   def set_items
#     # 親カテゴリーの場合
#     if self.root?
#       start_id = self.indirects.first.id
#       end_id = self.indirects.last.id
#       items = Item.where(category_id: start_id..end_id)
#       return items

#       # 子カテゴリーの場合
#     elsif self.has_children?
#       start_id = self.children.first.id
#       end_id = self.children.last.id
#       items = Item.where(category_id: start_id..end_id)
#       return items

#       # 孫カテゴリーの場合
#     else
#       return self.items
#     end
#   end
# end