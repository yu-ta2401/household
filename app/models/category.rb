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
