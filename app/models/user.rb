class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   
  has_many :post_images, dependent: :destroy #userのあるデータを削除すると、その関係のあるarticlesを自動的にすべて削除できる。
                      #deoendent: destroyの性質により、user.idをキーとして持ってるすべてのarticleをすべて消すことができる。
end
