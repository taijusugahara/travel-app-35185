class TourSpan < ActiveHash::Base
  self.data = [
    { id: 1, name: '2021/1/1' },
    { id: 2, name: '2021/1/10' },
    { id: 3, name: '2021/1/20' },
    { id: 4, name: '2021/2/1' },
    { id: 5, name: '2021/2/10' },
    { id: 6, name: '2021/2/20' },
    { id: 7, name: '2021/3/1' },
    { id: 8, name: '2021/3/10' },
    { id: 9, name: '2021/3/20' },
    { id: 10, name: '2021/4/1' },
    { id: 11, name: '2021/4/10' },
    { id: 12, name: '2021/4/20' },
    { id: 13, name: '2021/5/1' },
    { id: 14, name: '2021/5/10' },
    { id: 15, name: '2021/5/20' },
    { id: 16, name: '2021/6/1' },
    { id: 17, name: '2021/6/10' },
    { id: 18, name: '2021/6/20' },
    { id: 19, name: '2021/7/1' },
    { id: 20, name: '2021/7/10' },
    { id: 21, name: '2021/7/20' },
    { id: 22, name: '2021/8/1' },
    { id: 23, name: '2021/8/10' },
    { id: 24, name: '2021/8/20' },
    { id: 25, name: '2021/9/1' },
    { id: 26, name: '2021/9/10' },
    { id: 27, name: '2021/9/20' },
    { id: 28, name: '2021/10/1' },
    { id: 29, name: '2021/10/10' },
    { id: 30, name: '2021/10/20' },
    { id: 31, name: '2021/11/1' },
    { id: 32, name: '2021/11/10' },
    { id: 33, name: '2021/11/20' },
    { id: 34, name: '2021/12/1' },
    { id: 35, name: '2021/12/10' },
    { id: 36, name: '2021/12/20' }
  ]

  include ActiveHash::Associations
  has_many :tours
end
